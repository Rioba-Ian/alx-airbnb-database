-- **********************************************
-- ALX Airbnb Database: Index Optimization Script
-- File: database_index.sql
-- Description: Create indexes and measure performance using EXPLAIN ANALYZE
-- **********************************************

-- =============================================
-- BEFORE indexing: Measure performance using EXPLAIN ANALYZE
-- =============================================

-- Booking count by user
EXPLAIN ANALYZE SELECT COUNT(*) FROM bookings WHERE user_id = 1;

-- Join Properties with bookings
EXPLAIN ANALYZE SELECT p.id, p.name, p.city, RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank
FROM properties p
JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name, p.city
ORDER BY rank;

-- FIlter bookings by date
EXPLAIN ANALYZE SELECT * FROM bookings WHERE check_in_date > '2025-01-01';


-- =============================================
-- CREATE INDEXES to optimize performance
-- =============================================

-- Indexes for booking count by user
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Indexes for join Properties with bookings
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Indexes for filter bookings by date
CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);
CREATE INDEX idx_bookings_check_out_date ON bookings(check_out_date);

-- =============================================
-- AFTER indexing: Measure performance using EXPLAIN ANALYZE
-- =============================================

-- Booking count by user
EXPLAIN ANALYZE SELECT COUNT(*) FROM bookings WHERE user_id = 1;

-- Join Properties with bookings
EXPLAIN ANALYZE SELECT p.id, p.name, p.city, RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank
FROM properties p
JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name, p.city
ORDER BY rank;

-- FIlter bookings by date
EXPLAIN ANALYZE SELECT * FROM bookings WHERE check_in_date > '2025-01-01';

-- =============================================
