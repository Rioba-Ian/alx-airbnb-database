-- Airbnb Clone Database Seed Data
-- This script populates the database with sample data for testing and development

-- Clear existing data (optional - uncomment if needed)
-- TRUNCATE TABLE messages, reviews, payments, bookings, properties, users RESTART IDENTITY CASCADE;

-- =============================================
-- SEED DATA FOR USERS TABLE
-- =============================================

INSERT INTO users (id, name, email, password_hash, phone, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'John Smith', 'john.smith@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0101', '2023-01-15 10:30:00', '2023-01-15 10:30:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Sarah Johnson', 'sarah.johnson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0102', '2023-01-20 14:45:00', '2023-01-20 14:45:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Michael Chen', 'michael.chen@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0103', '2023-02-01 09:15:00', '2023-02-01 09:15:00'),
('550e8400-e29b-41d4-a716-446655440004', 'Emily Davis', 'emily.davis@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0104', '2023-02-10 16:20:00', '2023-02-10 16:20:00'),
('550e8400-e29b-41d4-a716-446655440005', 'David Wilson', 'david.wilson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0105', '2023-02-15 11:10:00', '2023-02-15 11:10:00'),
('550e8400-e29b-41d4-a716-446655440006', 'Lisa Anderson', 'lisa.anderson@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0106', '2023-03-01 13:30:00', '2023-03-01 13:30:00'),
('550e8400-e29b-41d4-a716-446655440007', 'Robert Brown', 'robert.brown@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0107', '2023-03-05 08:45:00', '2023-03-05 08:45:00'),
('550e8400-e29b-41d4-a716-446655440008', 'Jennifer Martinez', 'jennifer.martinez@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0108', '2023-03-10 15:00:00', '2023-03-10 15:00:00'),
('550e8400-e29b-41d4-a716-446655440009', 'Christopher Lee', 'christopher.lee@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0109', '2023-03-15 12:20:00', '2023-03-15 12:20:00'),
('550e8400-e29b-41d4-a716-446655440010', 'Amanda Taylor', 'amanda.taylor@email.com', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewEyD.Uy1.QW8mCK', '555-0110', '2023-03-20 10:15:00', '2023-03-20 10:15:00');

-- =============================================
-- SEED DATA FOR PROPERTIES TABLE
-- =============================================

INSERT INTO properties (id, owner_id, title, description, address, city, state, country, price_per_night, max_guests, num_bedrooms, num_bathrooms, amenities, created_at, updated_at) VALUES
('650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Downtown Apartment', 'Beautiful modern apartment in the heart of the city with stunning views and all amenities.', '123 Main Street, Unit 4B', 'New York', 'NY', 'USA', 150.00, 4, 2, 1, 'WiFi,Kitchen,Air Conditioning,Heating,TV,Washer,Dryer', '2023-01-16 11:00:00', '2023-01-16 11:00:00'),
('650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', 'Beachfront Villa', 'Luxurious villa with direct beach access, perfect for family vacations.', '456 Ocean Drive', 'Miami', 'FL', 'USA', 300.00, 8, 4, 3, 'WiFi,Kitchen,Air Conditioning,Pool,Beach Access,Parking,BBQ Grill', '2023-01-21 12:30:00', '2023-01-21 12:30:00'),
('650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440003', 'Mountain Cabin Retreat', 'Peaceful cabin surrounded by nature, ideal for hiking and relaxation.', '789 Pine Ridge Road', 'Aspen', 'CO', 'USA', 200.00, 6, 3, 2, 'WiFi,Kitchen,Heating,Fireplace,Parking,Hot Tub,Mountain View', '2023-02-02 14:15:00', '2023-02-02 14:15:00'),
('650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440004', 'Historic Brownstone', 'Charming historic home with modern amenities in trendy neighborhood.', '321 Elm Street', 'Boston', 'MA', 'USA', 180.00, 5, 3, 2, 'WiFi,Kitchen,Air Conditioning,Heating,Parking,Garden,Historic Charm', '2023-02-11 09:45:00', '2023-02-11 09:45:00'),
('650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440005', 'Modern Loft', 'Stylish industrial loft in converted warehouse with exposed brick.', '555 Industrial Blvd, Loft 3', 'Portland', 'OR', 'USA', 120.00, 3, 1, 1, 'WiFi,Kitchen,Air Conditioning,Heating,Elevator,Exposed Brick,City View', '2023-02-16 16:00:00', '2023-02-16 16:00:00'),
('650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440006', 'Lakeside Cottage', 'Charming cottage with private dock and lake access.', '777 Lakeshore Drive', 'Lake Tahoe', 'CA', 'USA', 250.00, 6, 2, 2, 'WiFi,Kitchen,Heating,Fireplace,Lake Access,Dock,Kayaks,Fishing', '2023-03-02 11:20:00', '2023-03
-02 11:20:00'),
('650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440007', 'Urban Studio', 'Compact but efficient studio in vibrant arts district.', '888 Art Street, Studio 2A', 'Austin', 'TX', 'USA', 85.00, 2, 1, 1, 'WiFi,Kitchen,Air Conditioning,Heating,Bike Storage,Arts District', '2023-03-06 13:45:00', '2023-03-06 13:45:00'),
('650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440008', 'Suburban Family Home', 'Spacious family home with large backyard and play area.', '999 Maple Avenue', 'Phoenix', 'AZ', 'USA', 140.00, 8, 4, 3, 'WiFi,Kitchen,Air Conditioning,Pool,Backyard,Playground,Parking,BBQ', '2023-03-11 10:30:00', '2023-03-11 10:30:00'),
('650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440009', 'Penthouse Suite', 'Luxury penthouse with panoramic city views and rooftop terrace.', '111 Skyline Tower, Penthouse', 'Chicago', 'IL', 'USA', 400.00, 6, 3, 3, 'WiFi,Kitchen,Air Conditioning,Heating,Elevator,Rooftop,City View,Gym Access', '2023-03-16 15:15:00', '2023-03-16 15:15:00'),
('650e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440010', 'Wine Country Retreat', 'Elegant home in wine country with vineyard views.', '222 Vineyard Lane', 'Napa', 'CA', 'USA', 350.00, 6, 3, 2, 'WiFi,Kitchen,Air Conditioning,Heating,Vineyard View,Wine Tasting,Parking', '2023-03-21 12:00:00', '2023-03-21 12:00:00');

-- =============================================
-- SEED DATA FOR BOOKINGS TABLE
-- =============================================

INSERT INTO bookings (id, user_id, property_id, check_in_date, check_out_date, num_guests, total_price, status, created_at, updated_at) VALUES
('750e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440001', '2023-06-01', '2023-06-05', 2, 600.00, 'completed', '2023-05-15 10:00:00', '2023-06-05 11:00:00'),
('750e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440002', '2023-06-10', '2023-06-14', 6, 1200.00, 'completed', '2023-05-20 14:30:00', '2023-06-14 12:00:00'),
('750e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440003', '2023-07-01', '2023-07-07', 4, 1200.00, 'completed', '2023-06-10 09:15:00', '2023-07-07 10:00:00'),
('750e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440004', '2023-07-15', '2023-07-18', 3, 540.00, 'completed', '2023-06-25 16:45:00', '2023-07-18 11:30:00'),
('750e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440005', '2023-08-01', '2023-08-05', 2, 480.00, 'completed', '2023-07-10 13:20:00', '2023-08-05 12:00:00'),
('750e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440008', '650e8400-e29b-41d4-a716-446655440006', '2023-08-10', '2023-08-14', 4, 1000.00, 'completed', '2023-07-20 11:00:00', '2023-08-14 13:00:00'),
('750e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440009', '650e8400-e29b-41d4-a716-446655440007', '2023-09-01', '2023-09-03', 2, 170.00, 'completed', '2023-08-15 15:30:00', '2023-09-03 10:00:00'),
('750e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440010', '650e8400-e29b-41d4-a716-446655440008', '2023-09-15', '2023-09-20', 6, 700.00, 'completed', '2023-08-25 12:15:00', '2023-09-20 11:00:00'),
('750e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440009', '2023-10-01', '2023-10-04', 4, 1200.00, 'confirmed', '2023-09-10 14:00:00', '2023-09-10 14:00:00'),
('750e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440010', '2023-10-15', '2023-10-18', 4, 1050.00, 'confirmed', '2023-09-20 16:30:00', '2023-09-20 16:30:00'),
('750e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440001', '2023-11-01', '2023-11-03', 2, 300.00, 'pending', '2023-10-15 10:45:00', '2023-10-15 10:45:00'),
('750e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440002', '2023-11-10', '2023-11-12', 4, 600.00, 'cancelled', '2023-10-20 13:00:00', '2023-10-25 09:00:00');

-- =============================================
-- SEED DATA FOR PAYMENTS TABLE
-- =============================================

INSERT INTO payments (id, booking_id, user_id, amount, payment_method, payment_status, paid_at, created_at, updated_at) VALUES
('850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', 600.00, 'credit_card', 'completed', '2023-05-15 10:15:00', '2023-05-15 10:15:00', '2023-05-15 10:15:00'),
('850e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 1200.00, 'paypal', 'completed', '2023-05-20 14:45:00', '2023-05-20 14:45:00', '2023-05-20 14:45:00'),
('850e8400-e29b-41d4-a716-446655440003', '750e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440005', 1200.00, 'credit_card', 'completed', '2023-06-10 09:30:00', '2023-06-10 09:30:00', '2023-06-10 09:30:00'),
('850e8400-e29b-41d4-a716-446655440004', '750e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440006', 540.00, 'debit_card', 'completed', '2023-06-25 17:00:00', '2023-06-25 17:00:00', '2023-06-25 17:00:00'),
('850e8400-e29b-41d4-a716-446655440005', '750e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440007', 480.00, 'credit_card', 'completed', '2023-07-10 13:35:00', '2023-07-10 13:35:00', '2023-07-10 13:35:00'),
('850e8400-e29b-41d4-a716-446655440006', '750e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440008', 1000.00, 'bank_transfer', 'completed', '2023-07-20 11:30:00', '2023-07-20 11:30:00', '2023-07-20 11:30:00'),
('850e8400-e29b-41d4-a716-446655440007', '750e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440009', 170.00, 'credit_card', 'completed', '2023-08-15 15:45:00', '2023-08-15 15:45:00', '2023-08-15 15:45:00'),
('850e8400-e29b-41d4-a716-446655440008', '750e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440010', 700.00, 'paypal', 'completed', '2023-08-25 12:30:00', '2023-08-25 12:30:00', '2023-08-25 12:30:00'),
('850e8400-e29b-41d4-a716-446655440009', '750e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440003', 1200.00, 'credit_card', 'completed', '2023-09-10 14:15:00', '2023-09-10 14:15:00', '2023-09-10 14:15:00'),
('850e8400-e29b-41d4-a716-446655440010', '750e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440004', 1050.00, 'debit_card', 'completed', '2023-09-20 16:45:00', '2023-09-20 16:45:00', '2023-09-20 16:45:00'),
('850e8400-e29b-41d4-a716-446655440011', '750e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440005', 300.00, 'credit_card', 'pending', NULL, '2023-10-15 10:50:00', '2023-10-15 10:50:00'),
('850e8400-e29b-41d4-a716-446655440012', '750e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440006', 600.00, 'credit_card', 'refunded', '2023-10-20 13:15:00', '2023-10-20 13:15:00', '2023-10-25 09:30:00');

-- =============================================
-- SEED DATA FOR REVIEWS TABLE
-- =============================================

INSERT INTO reviews (id, user_id, property_id, booking_id, rating, comment, created_at, updated_at) VALUES
('950e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', 5, 'Amazing apartment! Perfect location and very clean. The host was super responsive and helpful. Would definitely stay again!', '2023-06-06 14:30:00', '2023-06-06 14:30:00'),
('950e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440002', 4, 'Beautiful beachfront villa with stunning views. The pool was great and beach access was convenient. Only minor issue was the AC in one bedroom.', '2023-06-15 16:45:00', '2023-06-15 16:45:00'),
('950e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440003', '750e8400-e29b-41d4-a716-446655440003', 5, 'Perfect mountain retreat! The cabin was cozy and well-equipped. Loved the hot tub and fireplace. Great for a relaxing getaway.', '2023-07-08 12:20:00', '2023-07-08 12:20:00'),
('950e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440004', '750e8400-e29b-41d4-a716-446655440004', 4, 'Charming historic home with character. Great neighborhood for walking. Kitchen was well-stocked and beds were comfortable.', '2023-07-19 10:15:00', '2023-07-19 10:15:00'),
('950e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440005', '750e8400-e29b-41d4-a716-446655440005', 3, 'Nice loft space but a bit noisy from the street. Industrial design was cool. Good for a short stay.', '2023-08-06 15:30:00', '2023-08-06 15:30:00'),
('950e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440008', '650e8400-e29b-41d4-a716-446655440006', '750e8400-e29b-41d4-a716-446655440006', 5, 'Absolutely loved this lakeside cottage! The dock was perfect for morning coffee. Kayaks were a nice touch. Very peaceful and relaxing.', '2023-08-15 11:45:00', '2023-08-15 11:45:00'),
('950e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440009', '650e8400-e29b-41d4-a716-446655440007', '750e8400-e29b-41d4-a716-446655440007', 4, 'Great studio in the arts district. Compact but efficient use of space. Loved being able to walk to galleries and restaurants.', '2023-09-04 13:20:00', '2023-09-04 13:20:00'),
('950e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440010', '650e8400-e29b-41d4-a716-446655440008', '750e8400-e29b-41d4-a716-446655440008', 5, 'Perfect family home! Kids loved the pool and playground. Spacious rooms and great backyard for BBQ. Host provided everything we needed.', '2023-09-21 16:00:00', '2023-09-21 16:00:00');

-- =============================================
-- SEED DATA FOR MESSAGES TABLE
-- =============================================

INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('a50e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', 'Hi! I am interested in booking your downtown apartment for next month. Is it available June 1-5?', '2023-05-14 14:30:00'),
('a50e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440003', 'Hello! Yes, the apartment is available for those dates. I will send you the booking details.', '2023-05-14 16:45:00'),
('a50e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'Your beachfront villa looks amazing! Can you tell me more about the beach access?', '2023-05-19 10:20:00'),
('a50e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 'Thank you! The villa has direct beach access just steps from the back door. Private section of beach for guests.', '2023-05-19 12:15:00'),
('a50e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', 'Hi! Do you allow pets at the mountain cabin?', '2023-06-08 09:30:00'),
('a50e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440005', 'Sorry, no pets allowed at the cabin. But there are great hiking trails nearby for outdoor activities!', '2023-06-08 11:45:00'),
('a50e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440004', 'What is the parking situation at the brownstone?', '2023-06-24 15:20:00'),
('a50e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440006', 'There is one dedicated parking spot included with the brownstone. Street parking is also available.', '2023-06-24 17:30:00'),
('a50e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440005', 'Is the loft accessible by elevator?', '2023-07-09 14:15:00'),
('a50e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440007', 'Yes, there is an elevator in the building. The loft is on the 3rd floor.', '2023-07-09 16:20:00'),
('a50e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440006', 'Hi! Can we use the kayaks at the lakeside cottage?', '2023-07-18 10:00:00'),
('a50e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440008', 'Absolutely! Two kayaks are included with your stay. Life jackets are provided in the cottage.', '2023-07-18 12:30:00'),
('a50e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440007', 'Is there good public transportation near the studio?', '2023-08-14 13:45:00'),
('a50e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440009', 'Yes! The bus stop is 2 blocks away and the light rail station is about 5 minutes walk.', '2023-08-14 15:00:00'),
('a50e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440008', 'Do you have a high chair available for our toddler?', '2023-08-23 11:20:00'),
('a50e8400-e29b-41d4-a716-446655440016', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440010', 'Yes, we have a high chair, pack-n-play, and other baby essentials available upon request.', '2023-08-23 13:15:00'),
('a50e8400-e29b-41d4-a716-446655440017', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440009', 'The penthouse looks incredible! Is there a minimum stay requirement?', '2023-09-08 16:30:00'),
('a50e8400-e29b-41d4-a716-446655440018', '550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440003', 'Thank you! There is a 3-night minimum stay for the penthouse during peak season.', '2023-09-08 18:45:00');

-- =============================================
-- DATA SUMMARY
-- =============================================

-- Total records inserted:
-- Users: 10
-- Properties: 10
-- Bookings: 12
-- Payments: 12
-- Reviews: 8
-- Messages: 18

-- Sample data provides:
-- - Diverse property types across multiple US cities
-- - Realistic booking patterns with various statuses
-- - Complete payment records with different methods
-- - Authentic user reviews with ratings 3-5 stars
-- - Natural message conversations between users and hosts
-- - Price range from $85 to $400 per night
-- - Properties accommodating 2-8 guests

-- End of seed data
