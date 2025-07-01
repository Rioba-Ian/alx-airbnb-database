-- ================
-- 1. INNER JOIN: Bookings and their respective users.
-- ================


SELECT b.id, b.start_date, b.end_date, u.name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- ================
-- 2. LEFT JOIN: Properties and their reviews
-- ================

SELECT p.id, p.name, p.description, r.rating, r.comment
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;


-- ================
-- 3. FULL OUTER JOIN: All users and all bookings
-- ================

SELECT u.id, u.name, u.email, b.id, b.start_date, b.end_date
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;
