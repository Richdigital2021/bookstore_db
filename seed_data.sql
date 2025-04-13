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