# Partitioning Performance Report

## Objective
Implement table partitioning on the `Booking` table to optimize query performance on large datasets.

## Implementation
- **Partition Type**: RANGE partitioning based on `start_date`.
- **Partition Strategy**: One partition per year (2023, 2024, 2025), plus a default partition.
- **Indexes**: Created on `user_id` and `start_date` columns in each partition to speed up query execution.

## Test Query
Example query fetching bookings in a date range:
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
