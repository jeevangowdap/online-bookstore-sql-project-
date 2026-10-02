--CREATE DATABASE
CREATE DATABASE OnlineBookstore;

--Switch To The Database


--CREATE TABLES
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT 
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(50),
	Email VARCHAR(50),
	Phone INT,
	City VARCHAR(50),
	Country VARCHAR(50)
);
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	ORDER_ID SERIAL PRIMARY KEY,
	CUSTOMER_ID INT REFERENCES CUSTOMERS(Customer_ID),
	BOOK_ID INT REFERENCES BOOKS(Book_ID),
	ORDER_DATE DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

--IMPORT DATA INTO BOOK TABLE
COPY Books(BOOK_ID,Title,Author,Genre,Published_Year,Price,Stock)
FROM 'C:/Users/My PC/Favorites/Downloads/Books (1).csv'
CSV HEADER

--IMPORT DATA INTO CUSTOMER TABLE
COPY Customers(Customer_ID,Name,Email,Phone,City,Country)
FROM 'C:\Users\My PC\Favorites\Downloads\Customers.csv'
CSV HEADER

--IMPORT DATA INTO ORDER TABLE
COPY ORDERS(Order_id,Customer_ID,book_id,order_date,quantity,total_amount)
FROM 'C:\Users\My PC\Favorites\Downloads\Orders (1).csv'
CSV HEADER

--RETRIVE ALL BOOKS FROM FICTION GENRE
SELECT *FROM Books
WHERE genre ='FICTION';

--FIND BOOKS PIBLISHED AFTER THE YEAR 1950:
SELECT *FROM Books
WHERE published_year>1950;

--LIST ALL CUSTOMER FROM CANNADA
SELECT *FROM Customers
WHERE Country='Canada';

--SHOW ORDERS PLACED IN NOVEMBER 2023
SELECT *FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

--CALCULATE TOTAL BOOKS IN STOCK
SELECT SUM(stock) AS Total_stock from Books;

--FIND THE DETAILS OF THE MOST EXPENSIVE BOOK
SELECT * FROM Books ORDER BY PRICE DESC;

--LIST CUSTOMERS WHO HAVE PLACED AT LEAST 2 ORDERS:
SELECT o.customer_id,c.name,Count(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id=c.name
HAVING COUNT(Order_id)>=2;

--Find the most frequently ordered book:
SELECT Book_id,COUNT(order_id) AS ORDER_COUNT
FROM orders
GROUP BY Book_id
ORDER BY ORDER_COUNT DESC LIMIT 1;

--SHOW THE TOP 3 MOST EXPENSIVE BOOKS OF 'FANTASY' GENRE:
SELECT * FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;

--RETRIEVE THE QUANTITY OF BOOKS SOLD BY EACH OTHER 
SELECT b.author,SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.Author;

--LIST THE CITIES WHERE CUSTOMERS WHO SPENT OVER $30 ARE LOCATED:
SELECT DISTINCT c.city,total_amount
FROM orders o
JOIN customers c ON O.Customer_id=c.customer_id
WHERE o.total_amount >30;

--FIND THE CUSTOMER WHOL HAVE SPEND MORE ON ORDERS:
SELECT c.customer_id,c.name,SUM(O.total_amount)AS Total_spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id,c.name
ORDER BY Total_spent DESC LIMIT 1;

--CALCULATE THE STOCK REMAINING AFTER FULLFILLING ALL ORDERS:
SELECT b.book_id,b.title,b.stock,COALESCE(SUM(quantity),0) AS Order_quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id;

