-- ===========================
-- INSERT SAMPLE DATA
-- ===========================

-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'Olivia', 'Johnson', 'olivia.johnson@example.com', 'hashed_pw_olivia', '555-123-1111', 'host'),
  ('00000000-0000-0000-0000-000000000002', 'Liam', 'Williams', 'liam.williams@example.com', 'hashed_pw_liam', '555-234-2222', 'guest'),
  ('00000000-0000-0000-0000-000000000003', 'Emma', 'Brown', 'emma.brown@example.com', 'hashed_pw_emma', '555-345-3333', 'guest'),
  ('00000000-0000-0000-0000-000000000004', 'Noah', 'Miller', 'noah.miller@example.com', 'hashed_pw_noah', NULL, 'admin');

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', 'Urban Loft', 'Modern loft in downtown Chicago with skyline views.', 'Chicago, IL', 175.00),
  ('11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000001', 'Beachfront Villa', 'Luxurious beachfront villa with pool and private access.', 'Malibu, CA', 450.00),
  ('11111111-1111-1111-1111-111111111113', '00000000-0000-0000-0000-000000000001', 'Rustic Farmhouse', 'Peaceful countryside farmhouse surrounded by nature.', 'Asheville, NC', 130.00);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('22222222-2222-2222-2222-222222222221', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000002', '2025-07-01', '2025-07-04', 525.00, 'confirmed'),
  ('22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000003', '2025-07-10', '2025-07-15', 2250.00, 'pending'),
  ('22222222-2222-2222-2222-222222222223', '11111111-1111-1111-1111-111111111113', '00000000-0000-0000-0000-000000000002', '2025-08-01', '2025-08-03', 260.00, 'canceled');

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('33333333-3333-3333-3333-333333333331', '22222222-2222-2222-2222-222222222221', 525.00, 'paypal'),
  ('33333333-3333-3333-3333-333333333332', '22222222-2222-2222-2222-222222222222', 2250.00, 'credit_card');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('44444444-4444-4444-4444-444444444441', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000002', 4, 'Stylish and well-located, but a bit noisy at night.'),
  ('44444444-4444-4444-4444-444444444442', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000003', 5, 'Absolutely amazing! Would stay again.'),
  ('44444444-4444-4444-4444-444444444443', '11111111-1111-1111-1111-111111111113', '00000000-0000-0000-0000-000000000002', 3, 'Nice getaway, but the Wi-Fi was spotty.');

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('55555555-5555-5555-5555-555555555551', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Hi Olivia, is early check-in available for the Urban Loft on July 1st?'),
  ('55555555-5555-5555-5555-555555555552', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Hi Liam, yes early check-in at 1 PM is no problem.'),
  ('55555555-5555-5555-5555-555555555553', '00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000001', 'Hello, I had a question about the pool access at the Beachfront Villa.'),
  ('55555555-5555-5555-5555-555555555554', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000003', 'Hi Emma, the pool is private and available during your stay.');