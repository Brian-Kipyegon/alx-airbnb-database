-- Initial query: Retrieve all bookings with user, property, and payment details
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
LEFT JOIN 
    payments pay ON b.payment_id = pay.id
WHERE 
    b.start_date >= '2025-01-01'  -- Filter on bookings starting from 2025
    AND pay.status = 'completed'  -- Filter only completed payments
ORDER BY 
    b.start_date DESC;

-- Performance analysis of the initial query
-- Initial query: Retrieve all bookings with user, property, and payment details
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
LEFT JOIN 
    payments pay ON b.payment_id = pay.id
WHERE 
    b.start_date >= '2025-01-01'  -- Filter on bookings starting from 2025
    AND pay.status = 'completed'  -- Filter only completed payments
ORDER BY 
    b.start_date DESC;


-- Refactored query: Use SELECT with essential fields and indexing
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
LEFT JOIN 
    payments pay ON b.payment_id = pay.id
ORDER BY 
    b.start_date DESC
LIMIT 100; -- Added limit for better performance in UI scenarios
