-- =============================================
-- 1. Aggregation:
-- Count the total number of bookings made by each user
-- =============================================


SELECT u.id, u.name, u.email, COUNT(b.id) AS total_bookings FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name, u.email
ORDER BY total_bookings DESC;


-- =============================================
-- 2. Window Functions:
-- Rank properties based on total number of bookings using ROW_NUMBER()
-- =============================================


SELECT p.id, p.name, p.city, ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS rank
FROM properties p
JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name, p.city
ORDER BY rank;

-- =============================================
-- 3. Window Functions with RANK():
-- Rank properties based on total number of bookings using RANK()
-- =============================================

SELECT p.id, p.name, p.city, RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank
FROM properties p
JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name, p.city
ORDER BY rank;
