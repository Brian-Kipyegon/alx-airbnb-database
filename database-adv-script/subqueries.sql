-- 4. Non-correlated Subquery: Find all properties where the average rating is greater than 4.0
SELECT p.id, p.name
FROM properties p
WHERE (
    SELECT AVG(r.rating)
    FROM reviews r
    WHERE r.property_id = p.id
) > 4.0;

-- 5. Correlated Subquery: Find users who have made more than 3 bookings
SELECT u.id, u.name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
