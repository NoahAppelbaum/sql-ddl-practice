CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    code VARCHAR(6) PRIMARY KEY,
    model VARCHAR(20),
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers
    order_date DATE
);

CREATE TABLE bike_purchases (
    id SERIAL PRIMARY KEY,
    model VARCHAR(6) NOT NULL REFERENCES bikes,
    order_id INT NOT NULL REFERENCES orders,
    purchase_price NUMERIC (10, 2) NOT NULL,
    note TEXT
);


INSERT INTO customers (first_name, last_name)
VALUES ('John', 'Jorkenson'), ('Millard', 'Filmore'), ('Ted', 'Tedric');

INSERT INTO bikes (code, model, price)
VALUES ('FLY', 'The Flyer', 500), ('HAUL','The Big Haul', 600),
 ('SKIN', 'The Skinny', 700), ('BUD', 'Big Buddy', 800);

 INSERT INTO orders (customer_id)
 VALUES (1), (1), (2), (3);

 INSERT INTO bike_purchases (model, order_id, purchase_price)
 VALUES ('HAUL', 1, 500), ('HAUL', 2, 500), ('FLY', 2, 500),
 ('HAUL', 3, 600), ('BUD', 4, 800), ('SKIN', 4, 650);

 SELECT order_id, (customers.first_name || customers.last_name) AS customer,
  COUNT(bike_purchases.id) AS num_bikes, SUM(bike_purchases.purchase_price) AS total
  FROM orders
  JOIN customers ON customers.id = customer_id
  JOIN bike_purchases ON bike_purchases.order_id = orders.id
  GROUP BY order_id, customers.id
  ORDER BY order_id;

SELECT (customers.first_name || customers.last_name) AS customer,
bikes.model, order_id, bike_purchases.note
FROM customers
JOIN orders ON customer_id = customers.id
JOIN bike_purchases ON order_id = orders.id
JOIN bikes ON bike_purchases.model = bikes.code;
