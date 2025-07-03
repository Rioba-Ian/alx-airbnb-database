-- ******************************************************
-- ALX Airbnb Database: Partitioning Bookings Table
-- File: partitioning.sql
-- Description: Re-creating bookings table using RANGE partitioning on start_date
-- ******************************************************

-- Step 1: Rename original table to preserve data
RENAME TABLE bookings TO bookings_backup;


-- Step 2: Create new partitioned bookings table

CREATE TABLE bookings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  listing_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p_2024 VALUES LESS THAN (2025)
  PARTITION p_2025 VALUES LESS THAN (2026)
)


-- STep 3: Copy data from backup table into partitioned table

INSERT INTO bookings (user_id, listing_id, start_date, end_date, status)
SELECT user_id, listing_id, start_date, end_date, status
FROM bookings_backup;

-- Step 4: Run a sample performance test to verify data integrity and partitioning effectiveness
EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
