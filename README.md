Online Food Ordering and Delivery System - Database Project

This project builds a Relational Database Management System (RDBMS) for an Online Food Ordering and Delivery Platform.
It is designed to simplify the ordering, payment, and delivery process for both customers and restaurants, mimicking platforms like Swiggy, Zomato, or Uber Eats.

Submitted by
Name: Nidhi Gera

UID: 23BCA10010

Section: 23BCA4-B

Submitted to
Name: Mr. Arvinder Singh

Designation: Professor

Contents
Introduction

Techniques Used

System Configuration

Input Details

ER Diagram Explanation

Table Relations

Table Formats

Table Creation Scripts

SQL Queries with Outputs

Summary

Conclusion

Tools & Technologies
Operating System: Windows 10 / Linux

Database Software: MySQL (or any RDBMS supporting SQL)

Tools: MySQL Workbench

Processor: Intel Core i3 or higher

RAM: Minimum 4 GB

Storage: 1 GB available

Key Database Tables
Customer: Stores user personal details.

Restaurant: Stores restaurant details and locations.

Food_Item: Stores menu items offered by restaurants.

Order_Table: Stores placed orders.

Order_Details: Links orders and ordered food items.

Payment: Stores payment details related to orders.

Major Relationships
One customer can place multiple orders.

One restaurant can offer multiple food items.

Each order has one payment linked.

Many-to-many relation between Orders and Food Items (via Order_Details).

Key Features
Database normalization to avoid redundancy.

Strong data integrity through primary and foreign keys.

Support for real-world extensions like delivery tracking, discounts, and ratings.

Efficient SQL queries for selection, updates, deletions, joins, and aggregations.

Example SQL Operations
Insert Sample Data into Customers, Restaurants, Food Items, Orders, and Payments.

Retrieve orders placed by a customer.

Display food items available in a specific restaurant.

Update order statuses to 'Delivered'.

Delete food items.

Join Queries to show order details along with customer names and payment amounts.

Aggregate Functions to calculate total sales and count orders.

Highlights
The ER diagram represents a complete map of system entities and their relationships.

SQL Queries demonstrated various real-world tasks like sales calculations and order tracking.

Tables were carefully designed with proper constraints to maintain data quality.

Prepared the backend structure for a scalable online food delivery platform.

Conclusion
This project demonstrated the efficient design and implementation of a relational database for an online food ordering platform.
Through normalized database design, careful relationship mapping, and SQL query execution, the system ensures data integrity, flexibility, and real-world applicability.
It forms a strong foundation for future development into a full-scale web or mobile application.
