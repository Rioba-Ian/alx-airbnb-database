-- Airbnb Clone Database Schema
-- This script creates all tables, constraints, and indexes for the Airbnb clone project

-- Enable UUID extension for PostgreSQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =============================================
-- TABLE CREATION
-- =============================================

-- Users table - stores user account information
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Properties table - stores property listings
CREATE TABLE properties (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    owner_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    address VARCHAR(500) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night > 0),
    max_guests INTEGER NOT NULL CHECK (max_guests > 0),
    num_bedrooms INTEGER NOT NULL CHECK (num_bedrooms >= 0),
    num_bathrooms INTEGER NOT NULL CHECK (num_bathrooms >= 0),
    amenities TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Bookings table - stores booking information
CREATE TABLE bookings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    num_guests INTEGER NOT NULL CHECK (num_guests > 0),
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price > 0),
    status VARCHAR(20) NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'cancelled', 'completed')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_dates CHECK (check_out_date > check_in_date)
);

-- Payments table - stores payment transactions
CREATE TABLE payments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL,
    user_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    payment_method VARCHAR(50) NOT NULL CHECK (payment_method IN ('credit_card', 'debit_card', 'paypal', 'bank_transfer')),
    payment_status VARCHAR(20) NOT NULL DEFAULT 'pending' CHECK (payment_status IN ('pending', 'completed', 'failed', 'refunded')),
    paid_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Reviews table - stores property reviews and ratings
CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    booking_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Messages table - stores user-to-user messages
CREATE TABLE messages (
    message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- FOREIGN KEY CONSTRAINTS
-- =============================================

-- Properties foreign keys
ALTER TABLE properties
ADD CONSTRAINT fk_properties_owner_id
FOREIGN KEY (owner_id) REFERENCES users(id) ON DELETE CASCADE;

-- Bookings foreign keys
ALTER TABLE bookings
ADD CONSTRAINT fk_bookings_user_id
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE bookings
ADD CONSTRAINT fk_bookings_property_id
FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE;

-- Payments foreign keys
ALTER TABLE payments
ADD CONSTRAINT fk_payments_booking_id
FOREIGN KEY (booking_id) REFERENCES bookings(id) ON DELETE CASCADE;

ALTER TABLE payments
ADD CONSTRAINT fk_payments_user_id
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

-- Reviews foreign keys
ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_user_id
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_property_id
FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE;

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_booking_id
FOREIGN KEY (booking_id) REFERENCES bookings(id) ON DELETE CASCADE;

-- Messages foreign keys
ALTER TABLE messages
ADD CONSTRAINT fk_messages_sender_id
FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE messages
ADD CONSTRAINT fk_messages_recipient_id
FOREIGN KEY (recipient_id) REFERENCES users(id) ON DELETE CASCADE;

-- =============================================
-- INDEXES FOR PERFORMANCE OPTIMIZATION
-- =============================================

-- Users table indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_phone ON users(phone);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Properties table indexes
CREATE INDEX idx_properties_owner_id ON properties(owner_id);
CREATE INDEX idx_properties_city_state ON properties(city, state);
CREATE INDEX idx_properties_country ON properties(country);
CREATE INDEX idx_properties_price_range ON properties(price_per_night);
CREATE INDEX idx_properties_max_guests ON properties(max_guests);
CREATE INDEX idx_properties_created_at ON properties(created_at);

-- Bookings table indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);
CREATE INDEX idx_bookings_check_out_date ON bookings(check_out_date);
CREATE INDEX idx_bookings_dates_range ON bookings(check_in_date, check_out_date);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Payments table indexes
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
CREATE INDEX idx_payments_user_id ON payments(user_id);
CREATE INDEX idx_payments_payment_status ON payments(payment_status);
CREATE INDEX idx_payments_payment_method ON payments(payment_method);
CREATE INDEX idx_payments_paid_at ON payments(paid_at);
CREATE INDEX idx_payments_created_at ON payments(created_at);

-- Reviews table indexes
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_booking_id ON reviews(booking_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);
CREATE INDEX idx_reviews_created_at ON reviews(created_at);

-- Messages table indexes
CREATE INDEX idx_messages_sender_id ON messages(sender_id);
CREATE INDEX idx_messages_recipient_id ON messages(recipient_id);
CREATE INDEX idx_messages_sent_at ON messages(sent_at);

-- Composite indexes for common query patterns
CREATE INDEX idx_properties_location_price ON properties(city, state, price_per_night);
CREATE INDEX idx_bookings_property_dates ON bookings(property_id, check_in_date, check_out_date);
CREATE INDEX idx_reviews_property_rating ON reviews(property_id, rating);

-- =============================================
-- UNIQUE CONSTRAINTS
-- =============================================

-- Ensure one review per booking
ALTER TABLE reviews
ADD CONSTRAINT unique_review_per_booking
UNIQUE (booking_id);

-- =============================================
-- TRIGGERS FOR UPDATED_AT TIMESTAMPS
-- =============================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Apply triggers to tables with updated_at columns
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_properties_updated_at BEFORE UPDATE ON properties
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_bookings_updated_at BEFORE UPDATE ON bookings
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_payments_updated_at BEFORE UPDATE ON payments
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_reviews_updated_at BEFORE UPDATE ON reviews
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =============================================
-- COMMENTS FOR DOCUMENTATION
-- =============================================

COMMENT ON TABLE users IS 'Stores user account information and authentication data';
COMMENT ON TABLE properties IS 'Stores property listings with location and pricing details';
COMMENT ON TABLE bookings IS 'Stores booking requests and reservations';
COMMENT ON TABLE payments IS 'Stores payment transactions for bookings';
COMMENT ON TABLE reviews IS 'Stores user reviews and ratings for properties';
COMMENT ON TABLE messages IS 'Stores messages between users';

COMMENT ON COLUMN users.password_hash IS 'Hashed password for security';
COMMENT ON COLUMN properties.amenities IS 'JSON or comma-separated list of property amenities';
COMMENT ON COLUMN bookings.status IS 'Booking status: pending, confirmed, cancelled, completed';
COMMENT ON COLUMN payments.payment_status IS 'Payment status: pending, completed, failed, refunded';
COMMENT ON COLUMN reviews.rating IS 'Rating from 1 to 5 stars';
