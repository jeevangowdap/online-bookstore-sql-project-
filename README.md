# online-bookstore-sql-project-
SQL database project analyzing an online bookstore’s books, customers, orders, sales, and inventory using PostgreSQL, joins, aggregations, filtering, and sorting.
# Online Bookstore SQL Project

## Project Overview
This project uses PostgreSQL to analyze an online bookstore database containing books, customers, and orders. It demonstrates SQL database creation, data import, filtering, aggregation, joins, and business analysis.

## Objectives
- Manage book, customer, and order data.
- Analyze inventory and book prices.
- Identify customer purchasing behavior.
- Find popular books and authors.
- Calculate sales and customer spending.

## Database Schema
### Books
`Book_ID`, `Title`, `Author`, `Genre`, `Published_Year`, `Price`, `Stock`

### Customers
`Customer_ID`, `Name`, `Email`, `Phone`, `City`, `Country`

### Orders
`Order_ID`, `Customer_ID`, `Book_ID`, `Order_Date`, `Quantity`, `Total_Amount`

Relationships: Each order references a customer and a book through foreign keys.

## SQL Concepts Used
- CREATE DATABASE and CREATE TABLE
- Primary keys, foreign keys, and SERIAL
- CSV data import using COPY
- SELECT, WHERE, BETWEEN, and ORDER BY
- Aggregate functions: SUM and COUNT
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN
- DISTINCT, COALESCE, and LIMIT

## Business Questions Answered
1. Retrieve books in the Fiction genre.
2. Find books published after 1950.
3. List customers from Canada.
4. Retrieve orders placed in November 2023.
5. Calculate total inventory.
6. Rank books by price.
7. Identify customers with at least two orders.
8. Find the most frequently ordered book.
9. List the top three most expensive Fantasy books.
10. Calculate books sold by each author.
11. Find cities associated with orders above $30.
12. Identify the highest-spending customer.
13. Compare book stock with ordered quantities.

## Tools Used
- PostgreSQL
- SQL
- pgAdmin or PostgreSQL-compatible SQL editor
- CSV files for sample data
- Git and GitHub

## Project Structure
```text
online-bookstore-sql/
├── README.md
├── online_bookstore.sql
└── data/
    ├── Books.csv
    ├── Customers.csv
    └── Orders.csv
```

## How to Run
1. Install PostgreSQL and open pgAdmin or another PostgreSQL SQL editor.
2. Create the database and connect to it.
3. Create the Books, Customers, and Orders tables.
4. Import the CSV datasets using PostgreSQL COPY or pgAdmin's Import/Export tool.
5. Execute the analysis queries.

Note: PostgreSQL's `CREATE DATABASE` must be executed separately from the database session used to create tables. Server-side `COPY` reads files accessible to the PostgreSQL server and requires suitable permissions. Update file paths for your environment.

## Learning Outcomes
- Understand relational database design.
- Work with primary and foreign keys.
- Analyze structured data using SQL.
- Use joins and aggregate functions to answer business questions.
- Practice data analysis through a practical project.

## Future Improvements
- Add revenue by month and genre analysis.
- Calculate the actual remaining stock after fulfilled orders.
- Add views for sales and inventory reporting.
- Connect the database to Python or Power BI for dashboards.

## Author
Created as a SQL learning and portfolio project.

## License
This project is available for educational purposes.