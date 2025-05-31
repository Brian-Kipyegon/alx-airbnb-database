# Database Indexing Performance Report

## Objective
Identify and create indexes to improve query performance.

## Identified High-Usage Columns
Based on the SQL queries previously created (`joins_queries.sql`, `aggregations_and_window_functions.sql`), the following columns are frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses:

- **bookings.user_id**: Used in joins and filtering queries.
- **bookings.property_id**: Used in joins and filtering queries.
- **reviews.property_id**: Used in joins and filtering queries.
- **users.name**: May be used in search queries or filters.
- **bookings.booking_date**: Used in date filtering or ordering.
- **properties.name**: Used in searches and ordering.

## Created Indexes
```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_users_name ON users(name);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_properties_name ON properties(name);
