CREATE DATABASE store;
USE store;


# --user-----------------------------------------------------------------

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

INSERT INTO users (name , email) VALUES
("Yatin", "yatin22@gmail.com"),
("Simran", "simran2002@gmail.com"),
("Aashu", "aashu23@gmail.com"),
("Rinku", "rinkuji@gmail.com");

UPDATE users 
SET name = "Yatin Arora"
WHERE user_id = 1;

UPDATE users
SET name = "Simran Thapa"
WHERE user_id = 2;

UPDATE users
SET name = "Ashmit Kapoor"
WHERE user_id = 3;

DELETE FROM users
WHERE user_id = 4;


# --Products --------------------------------------------------------------

CREATE TABLE products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
price INT,
stock INT DEFAULT 0
);

INSERT INTO products (name, price, stock) VALUES
("Laptop", 60000, 10),
("Headphone", 2000, 50),
("Smartphone", 20000, 20),
("Tablet", 15000, 15),
("Smartwatch", 5000, 25);

SET SQL_SAFE_UPDATES = 0; 

UPDATE products
SET price = price + 1000;


# --Orders ---------------------------------------------------------

CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
order_date DATE,
FOREIGN KEY (user_id) REFERENCES users (user_id)
);

INSERT INTO orders (user_id, order_date) VALUES
(1,"2026-04-15"),
(2,"2026-04-15"),
(1,"2026-04-16"),
(3,"2026-04-16");


#-- order_items-------------------------------------------------------

CREATE TABLE order_items(
order_item_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1,1,1),
(2,1,1),
(3,3,2),
(4,5,4);


# -- payments--------------------------------------------------------

CREATE TABLE payments(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
amount DECIMAL,
payment_status VARCHAR(100),
FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

INSERT INTO payments(order_id, amount, payment_status) VALUES
(1,60000,"PENDING"),
(2,60000,"COMPLETED"),
(3,60000,"COMPLETED"),
(4,25000,"FAILED");


#BASIC SELECT
SELECT* FROM USERS;		

#SPECIFIC SELECT
SELECT name, email FROM users;

#WHERE CONDITION
SELECT * FROM products 
WHERE price >10000;

#AND CONDITION
SELECT * FROM products
WHERE price >10000 AND price <50000;

#OR CONDITION
SELECT * FROM payments
WHERE payment_status = "FAILED" OR payment_status = "PENDING";

#NOT CONDITION
SELECT * FROM users
WHERE NOT user_id = 1;

#BETWEEN
SELECT * FROM products
WHERE price BETWEEN 1000 and 20000;

#ORDER BY CLAUSE
SELECT * FROM products
ORDER BY stock ASC;

#LIMIT CLAUSE
SELECT * FROM products
LIMIT 3;

#COMBINED QUERY
SELECT name, price, stock FROM PRODUCTS
WHERE price >10000
ORDER BY stock desc 
LIMIT 3;
