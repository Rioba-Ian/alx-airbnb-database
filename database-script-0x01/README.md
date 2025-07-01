# Database Schema Script

This directory contains the SQL schema for the Airbnb Clone database.

## Files

- `schema.sql` - Complete database schema with tables, constraints, and indexes

## Usage

Execute the schema script on your PostgreSQL database:

```bash
psql -U username -d database_name -f schema.sql
```

## What's Included

- **6 Core Tables**: users, properties, bookings, payments, reviews, messages
- **Foreign Key Constraints**: Maintains referential integrity
- **Performance Indexes**: Optimized for common query patterns
- **Data Validation**: Check constraints for data integrity
- **Auto Timestamps**: Automatic updated_at triggers

## Requirements

- PostgreSQL 12+
- UUID extension support

## Tables Created

| Table      | Purpose                          |
| ---------- | -------------------------------- |
| users      | User accounts and authentication |
| properties | Property listings and details    |
| bookings   | Reservation management           |
| payments   | Payment transactions             |
| reviews    | Property ratings and feedback    |
| messages   | User-to-user communication       |
