---Create Database #bookstore_db ---
CREATE DATABASE bookstore_db;

---`create all the tables using 'Use Database bookstore_db' ---

---create table book_language ---

USE bookstore_db;

CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(50) NOT NULL
);

---create table publisher ---
USE bookstore_db;

CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

---create table book ---
USE bookstore_db;

CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    language_id INT,
    publisher_id INT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

---create table author ---
USE bookstore_db;

CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    bio TEXT
);

---create table book_author ---
USE bookstore_db;

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

---create table country---
USE bookstore_db;

CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100)
);

---create table address---
USE bookstore_db;   

CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

---create table address_status---
USE bookstore_db;

CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50)
);

---create table customer---
USE bookstore_db;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

---create table customer_address---
USE bookstore_db;

CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

---create table order_status---
USE bookstore_db;

CREATE TABLE order_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50)
);

---create table shipping_method---
USE bookstore_db;

CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100),
    cost DECIMAL(10,2),
    delivery_time_estimate VARCHAR(100)
);

---create table cust_order---
USE bookstore_db;

CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME,
    status_id INT,
    shipping_method_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id)
);

---create table order_line---
USE bookstore_db;

CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    price_at_purchase DECIMAL(10,2),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

---create table order_history---
USE bookstore_db;

CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status_id INT,
    change_date DATETIME,
    comments TEXT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

--- INSERTING DATA INTO ALL THE TABLES ---


-- Inserting data into the book_language table---

USE bookstore_db;

INSERT INTO book_language (language_name) VALUES
('English'),
('French'),
('Spanish'),
('German');

--- Inserting data into the publisher table---
USE bookstore_db;

INSERT INTO publisher (name, contact_email) VALUES
('Penguin Books', 'contact@penguin.com'),
('HarperCollins', 'info@harpercollins.com'),
('Random House', 'hello@randomhouse.com');

---- Inserting data into the book table---
USE bookstore_db;

INSERT INTO book (title, isbn, language_id, publisher_id, price, stock_quantity) VALUES
('The Great Gatsby', '9780743273565', 1, 1, 10.99, 50),
('To Kill a Mockingbird', '9780061120084', 1, 2, 8.99, 30),
('One Hundred Years of Solitude', '9780060883287', 3, 3, 12.50, 25);

--- Inserting data into the author table---
USE bookstore_db;

INSERT INTO author (first_name, last_name, bio) VALUES
('F. Scott', 'Fitzgerald', 'American novelist and short-story writer.'),
('Harper', 'Lee', 'Known for To Kill a Mockingbird.'),
('Gabriel', 'Garcia Marquez', 'Colombian novelist, Nobel Prize winner.');

--- Inserting data into the book_author table---
USE bookstore_db;

INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);

--- Inserting data into the country table---
USE bookstore_db;

INSERT INTO country (country_name) VALUES
('United States'),
('Canada'),
('Nigeria');

--- Inserting data into the address table---
USE bookstore_db;

INSERT INTO address (street, city, state, postal_code, country_id) VALUES
('123 Main St', 'New York', 'NY', '10001', 1),
('456 Queen St', 'Toronto', 'ON', 'M5H 2N2', 2),
('10 Allen Ave', 'Lagos', 'Lagos', '101001', 3);

--- Inserting data into the address_status table---
USE bookstore_db;

INSERT INTO address_status (status_name) VALUES
('Current'),
('Old');

--- Inserting data into the customer table---
USE bookstore_db;

INSERT INTO customer (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678');

--- Inserting data into the customer_address table---
USE bookstore_db;

INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),
(2, 2, 1);


--- Inserting data into the order_status table---
USE bookstore_db;

INSERT INTO shipping_method (method_name, cost, delivery_time_estimate) VALUES
('Standard Shipping', 5.00, '3-5 days'),
('Express Shipping', 10.00, '1-2 days');


--- Inserting data into the cust_order table---
USE bookstore_db;

INSERT INTO cust_order (customer_id, order_date, status_id, shipping_method_id) VALUES
(1, '2025-04-10 10:00:00', 1, 1),
(2, '2025-04-11 14:30:00', 3, 2);

--- Inserting data into the order_line table---
USE bookstore_db;

INSERT INTO order_line (order_id, book_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 10.99),
(1, 2, 2, 8.99),
(2, 3, 1, 12.50);

--- Inserting data into the order_history table---
USE bookstore_db;

INSERT INTO order_history (order_id, status_id, change_date, comments) VALUES
(1, 1, '2025-04-10 10:05:00', 'Order placed'),
(1, 2, '2025-04-10 11:00:00', 'Order processed'),
(2, 3, '2025-04-11 15:00:00', 'Order shipped');


--- Inserting data into the order_status table---
USE bookstore_db;

INSERT INTO order_status (status_name) VALUES 
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled'),
('Returned');


--- Inserting data into the shipping_method table---
USE bookstore_db;

INSERT INTO shipping_method (method_name, cost, delivery_time_estimate) VALUES
('Standard Shipping', 5.00, '3-5 days'),
('Express Shipping', 10.00, '1-2 days');


---Testing the SQL Queries---

---List all books with their language and publisher names---
USE bookstore_db;

SELECT b.title, b.isbn, bl.language_name, p.name AS publisher, b.price, b.stock_quantity
FROM book b
JOIN book_language bl ON b.language_id = bl.language_id
JOIN publisher p ON b.publisher_id = p.publisher_id;

---Books along with their authors---
USE bookstore_db;

SELECT b.title, a.first_name, a.last_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id;

---List all customers with current address and country---
USE bookstore_db;

SELECT c.first_name, c.last_name, c.email, a.street, a.city, a.state, a.postal_code, cn.country_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country cn ON a.country_id = cn.country_id
JOIN address_status ast ON ca.status_id = ast.status_id
WHERE ast.status_name = 'Current';

---List all orders with customer name, status, and shipping method---
USE bookstore_db;

SELECT co.order_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
       os.status_name, sm.method_name, co.order_date
FROM cust_order co
JOIN customer c ON co.customer_id = c.customer_id
JOIN order_status os ON co.status_id = os.status_id
JOIN shipping_method sm ON co.shipping_method_id = sm.shipping_method_id;

---View all order lines for a given order---
USE bookstore_db;

SELECT ol.order_id, b.title, ol.quantity, ol.price_at_purchase
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
WHERE ol.order_id = 1;

---Get full status history of an order---
USE bookstore_db;

SELECT oh.order_id, os.status_name, oh.change_date, oh.comments
FROM order_history oh
JOIN order_status os ON oh.status_id = os.status_id
WHERE oh.order_id = 1
ORDER BY oh.change_date ASC;

---Total number of orders per customer---
USE bookstore_db;

SELECT c.first_name, c.last_name, COUNT(co.order_id) AS total_orders
FROM customer c
JOIN cust_order co ON c.customer_id = co.customer_id
GROUP BY c.customer_id;

---Top selling books by quantity---
USE bookstore_db;

SELECT b.title, SUM(ol.quantity) AS total_sold
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
GROUP BY b.book_id
ORDER BY total_sold DESC;

---Check stock of all books---
USE bookstore_db;

SELECT title, stock_quantity
FROM book
ORDER BY stock_quantity ASC;

---Check for duplicate shipping methods---
USE bookstore_db;

SELECT method_name, COUNT(*) AS count
FROM shipping_method
GROUP BY method_name
HAVING COUNT(*) > 1;

---Find customers without any orders--
USE bookstore_db;

SELECT c.first_name, c.last_name
FROM customer c
LEFT JOIN cust_order co ON c.customer_id = co.customer_id
WHERE co.order_id IS NULL;