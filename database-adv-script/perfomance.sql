-- ==========
-- 1. Initial Query (unoptimized with WHERE and AND )
-- Retrieves all bookings with user, property and payment details
-- ==========


EXPLAIN ANALYZE
SELECT
  b.id AS booking_id,
  u.name,
  u.email,
  p.title AS property_name,
  p.city,
  pay.amount AS payment_amount,
  pay.status AS payment_status,
  pay.paid_at  AS payment_date
FROM
  bookings b
JOIN
  users u ON b.user_id = u.id
JOIN
  properties p ON b.property_id = p.id
JOIN
  payments pay ON b.id = pay.booking_id
WHERE
  b.check_in_date >= '2025-01-01'
  AND u.email LIKE '%@example.com';

-- ==========
-- 1. Optimized QUery
-- Removes unneccessary columns
-- Uses indexed columns and filtered WHERE
-- ==========

EXPLAIN ANALYZE
SELECT b.id AS booking_id, u.name, u.email, p.title AS property_name, p.city, pay.amount
FROM bookings b
JOIN users u ON b,user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE
  b.check_in_date >= '2025-01-01'
  AND u.email LIKE '%@example.com';
