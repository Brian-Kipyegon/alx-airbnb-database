# Database Normalization to Third Normal Form (3NF)

## Objective
Apply normalization principles to ensure the provided relational schema is in Third Normal Form (3NF), eliminating redundancy and ensuring data integrity.

---

## Step-by-Step Normalization

### 1. **First Normal Form (1NF)**

**Requirement:** All attributes must contain atomic (indivisible) values and each record must be unique.

✅ **Schema Status:**  
All fields are atomic — e.g., `email`, `phone_number`, `pricepernight`, etc.  
Each table has a primary key ensuring row uniqueness.

---

### 2. **Second Normal Form (2NF)**

**Requirement:** Must be in 1NF and all non-key attributes must be fully functionally dependent on the entire primary key (no partial dependencies).

✅ **Schema Status:**  
- All tables use single-attribute primary keys (UUIDs).  
- No partial dependencies exist. Each non-key attribute is fully dependent on the primary key.

---

### 3. **Third Normal Form (3NF)**

**Requirement:** Must be in 2NF and all attributes must be directly dependent on the primary key (no transitive dependencies).

✅ **Schema Status:**  
Most tables are already in 3NF, but let's validate and make improvements:

---

## Table Analysis and Adjustments

### **User**
- ✅ Already in 3NF.
- Each attribute (e.g., `email`, `role`) is directly dependent on `user_id`.

---

### **Property**
- ✅ Already in 3NF.
- All attributes describe a property and depend only on `property_id`.
- `host_id` is a foreign key, and not a transitive dependency.

---

### **Booking**
- ✅ Already in 3NF.
- All fields (e.g., `start_date`, `status`, `total_price`) depend directly on `booking_id`.

---

### **Payment**
- ✅ Already in 3NF.
- `amount`, `payment_method`, etc., depend directly on `payment_id`.
- `booking_id` is a foreign key; no transitive dependency.

---

### **Review**
- ✅ Already in 3NF.
- All attributes (`rating`, `comment`, etc.) depend on `review_id`.

---

### **Message**
- ✅ Already in 3NF.
- Each message is uniquely identified by `message_id`.
- `sender_id` and `recipient_id` are foreign keys, not violating 3NF.

---

## Optional Enhancements (Not Required by 3NF but Useful)

- Add `UNIQUE(property_id, user_id)` in **Review** to prevent duplicate reviews per property by the same user.
- Add `UNIQUE(booking_id)` in **Payment** if only one payment is allowed per booking.

---

## Conclusion

✅ **Final Status**:  
All tables conform to **Third Normal Form (3NF)**.  
The design ensures data integrity, avoids redundancy, and supports efficient querying and maintenance.

