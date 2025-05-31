# Airbnb Advanced Database Scripts

## Objective
Master SQL joins by writing complex queries using different types of joins.

## Queries in `joins_queries.sql`

### 1. INNER JOIN - Bookings and Users
Retrieves all bookings and the respective users who made those bookings.

```sql
SELECT b.id AS booking_id, b.property_id, b.booking_date, u.id AS user_id, u.name AS user_name
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

## Additional Queries for Subqueries

### 4. Non-correlated Subquery - Properties with Average Rating > 4.0
Finds all properties where the average rating from reviews is greater than 4.0.

```sql
SELECT p.id, p.name
FROM properties p
WHERE (
    SELECT AVG(r.rating)
    FROM reviews r
    WHERE r.property_id = p.id
) > 4.0;

# Airbnb Advanced Database Scripts

## Objective
Use SQL aggregation and window functions to analyze data.

## Queries in `aggregations_and_window_functions.sql`

### 1. Total Number of Bookings Made by Each User
Finds the total number of bookings made by each user using the `COUNT` function and `GROUP BY` clause.

```sql
SELECT u.id AS user_id, u.name AS user_name, COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;
