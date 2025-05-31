# Continuous Database Performance Monitoring Report

## Objective
Continuously monitor and refine the database’s performance by analyzing query execution plans and making schema adjustments.

---

## Step 1: Monitoring with EXPLAIN ANALYZE

### Query 1: Fetch Bookings by Date Range
```sql
EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
