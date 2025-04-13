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