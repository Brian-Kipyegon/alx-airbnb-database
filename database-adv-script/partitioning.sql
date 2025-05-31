-- Step 1: Create a new partitioned Booking table based on start_date

-- Assuming original 'bookings' table exists
-- We'll rename it to 'bookings_old' for reference
ALTER TABLE bookings RENAME TO bookings_old;

-- Create partitioned 'bookings' table using RANGE partitioning on start_date
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    property_id INTEGER NOT NULL,
    payment_id INTEGER,
    booking_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
) PARTITION BY RANGE (start_date);

-- Create partitions for each year (can be adjusted based on dataset size)
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Optionally create a default partition for unexpected dates
CREATE TABLE bookings_default PARTITION OF bookings
    DEFAULT;

-- Step 2: Populate new partitioned table with data from old table
INSERT INTO bookings (id, user_id, property_id, payment_id, booking_date, start_date, end_date)
SELECT id, user_id, property_id, payment_id, booking_date, start_date, end_date
FROM bookings_old;

-- Step 3: Create indexes on partitions to optimize queries
CREATE INDEX idx_bookings_2023_user_id ON bookings_2023(user_id);
CREATE INDEX idx_bookings_2024_user_id ON bookings_2024(user_id);
CREATE INDEX idx_bookings_2025_user_id ON bookings_2025(user_id);

CREATE INDEX idx_bookings_2023_start_date ON bookings_2023(start_date);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024(start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025(start_date);
