-- =============================================
-- 1. Non-Correlated subquery
-- Find all properties where the average rating is greater than 4.0
-- =============================================


SELECT p.id, p.name, p.city, p.state, p.country, p.price, p.bedrooms, p.bathrooms, p.amenities, p.created_at, p.updated_at
FROM properties p
WHERE p.id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- =============================================
-- 2. Correlated subquery
-- Find users who have made more than 3 bookings.
-- =============================================


SELECT u.id, u.email, u.first_name, u.last_name, u.phone_number, u.created_at, u.updated_at
FROM users u
WHERE  (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
