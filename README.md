# 📚 Bookstore Database Project

This project is a comprehensive SQL-based Bookstore Management System designed to manage books, authors, customers, orders, and shipping details efficiently. The database structure ensures normalized, scalable, and relational storage for real-world bookstore operations.

---

## 📌 Table of Contents

- [Overview](#overview)
- [Project Structure](#-project-structure)
- [Database Setup](#database-setup)
- [Database Schema](#database-schema)
- [Setup Instructions](#️setup-instructions)
- [Sample Data](#sample-data)
- [Contributing](#contributing)
- [License](#license)

---

## 🧾 Overview

This project implements a normalized relational database for a fictional bookstore using MySQL. It supports:

- Book and inventory management
- Author and publisher relationships
- Customer profiles and address history
- Orders and line items
- Order status tracking and shipping options

Ideal for learning or as a foundation for building bookstore management systems, e-commerce platforms, or retail applications.

---

## 🚀 Project Structure

The project covers:

- Database creation
- Table creation with relationships
- Data insertion
- Test queries for validation

```bash
bookstore-db/

├── schema image # The diagram of the schema
├── README.md   # Project documentation
├── schema.sql   # All CREATE TABLE statements
├── seed_data.sql # Sample data inserts
└── test_queries.sql  # Helpful SELECT queries
```

---

## 🧱 Database Setup

```sql
CREATE DATABASE bookstore_db;
USE bookstore_db;
```

## 🗂️ Database Schema

The system contains the following core tables:

| Table              | Description                               |
| ------------------ | ----------------------------------------- |
| `book_language`    | List of available book languages          |
| `publisher`        | Book publishers                           |
| `book`             | Book details including price & stock      |
| `author`           | Authors of books                          |
| `book_author`      | Many-to-many relationship (books/authors) |
| `country`          | Supported countries                       |
| `address`          | Customer address records                  |
| `address_status`   | Tracks whether an address is current/old  |
| `customer`         | Customer information                      |
| `customer_address` | Customer-address-status mapping           |
| `order_status`     | Predefined order states                   |
| `shipping_method`  | Delivery method and pricing               |
| `cust_order`       | Orders placed by customers                |
| `order_line`       | Line items per order                      |
| `order_history`    | Order status change logs                  |

---

## ⚙️ Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/bookstore-db.git
   cd bookstore-db
   ```
2. **Start MySQL Server and Log in**
   ```bash
   mysql -u root -p
   ```
3. **Create and Use the Database**
   ```bash
    CREATE DATABASE bookstore_db;
    USE bookstore_db;
   ```
4. **Run the SQL Scripts Execute the schema and data insertion files in order:**
   ```bash
   SOURCE schema.sql;
   SOURCE seed_data.sql;
   ```

## Sample Data

### 1. All books with their language and publisher

```bash
SELECT b.title, bl.language_name, p.name AS publisher
FROM book b
JOIN book_language bl ON b.language_id = bl.language_id
JOIN publisher p ON b.publisher_id = p.publisher_id;
```

### 2. 👤 Customers and their current address

```bash
SELECT c.first_name, a.city, cn.country_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country cn ON a.country_id = cn.country_id
WHERE ca.status_id = 1; -- Current
```

### 3. 📦 Orders with items and status

```bash
SELECT co.order_id, b.title, ol.quantity, os.status_name
FROM cust_order co
JOIN order_line ol ON co.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
JOIN order_status os ON co.status_id = os.status_id;
```

## 🤝 Contributing

### Contributions are welcome!

#### To contribute:

1. Fork this repo

2. Create a new branch: git checkout -b feature/feature-name
3. Commit your changes: git commit -am 'Add feature'
4. Push to the branch: git push origin feature/feature-name
5. Open a pull request

## 📄 License

This project is licensed under the MIT License. Feel free to use and modify for personal or commercial use.

## Collaborators:

### 1. Akintunde Richard

### 2. Tosin Williams

### 3. Georgina Adebi

## 📬 Contact

Team lead, Richard Akintunde – For questions or feedback, akintunderichard28@gmail.com
