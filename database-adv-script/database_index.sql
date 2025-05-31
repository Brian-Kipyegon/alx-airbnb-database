-- Creating indexes for high-usage columns based on WHERE, JOIN, and ORDER BY usage

-- 1. Index on user_id in bookings (used in JOINs and WHERE)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- 2. Index on property_id in bookings (used in JOINs and WHERE)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- 3. Index on property_id in reviews (used in JOINs and WHERE)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- 4. Index on name in users (if used in searches or filters)
CREATE INDEX idx_users_name ON users(name);

-- 5. Index on booking_date in bookings (if used in ORDER BY or filtering by date)
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- 6. Index on name in properties (if used in searches or ORDER BY)
CREATE INDEX idx_properties_name ON properties(name);
