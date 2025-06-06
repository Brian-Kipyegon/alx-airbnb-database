# Query Performance Optimization Report

## Objective
Refactor a complex query that retrieves bookings, user details, property details, and payment details to improve performance.

## Initial Query
```sql
SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
ORDER BY b.booking_date DESC;
