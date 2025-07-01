# Task

## Complex queries

**OBjective**: Writing complex queries with joins and subqueries.

- Inner join to retrieve all bookings and respective users who made those bookings.

- Writing a query using a left join to retrieve all properties and their respective reviews, including properties with no reviews.

- Writing a full outer join to retrieve all users and all bookings even if the user has no booking or a booking is not linked to a user.

## Subqueries

**Objective** Writing both correlated and non-correlated subqueries.

- Writing a query to find all properties where the average rating is greater than 4.0 using a subquery.

- Writing a correlated subquery to find users who have made more than 3 bookings.

## Applying Aggregations and window functions

**Objective**: Use SQL aggregation and window functions to analyze data.

**Instructions**:

- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
