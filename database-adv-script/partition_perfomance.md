# Partition Performance Optimization

**Objective**: Implement table partitioning to optimize queries on large datasets.

**Instructions**:

- Assume the Booking table is large and query performance is slow. Implement partitioning on the Booking table based on the start_date column. Save the query in a file partitioning.sql

- Test the performance of queries on the partitioned table (e.g., fetching bookings by date range).

- Write a brief report on the improvements you observed.

### ✅ Conclusion

✅ Partitioning the Booking table based on the start_date column significantly improved query performance. Queries that previously took several seconds now complete in milliseconds. This is because the database can quickly locate the relevant partitions without scanning the entire table.
