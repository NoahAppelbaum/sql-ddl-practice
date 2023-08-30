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

CREATE TABLE bike_purchases (
    id SERIAL PRIMARY KEY,
    model VARCHAR(6) NOT NULL REFERENCES bikes,
    order INT NOT NULL REFERENCES orders,
    purchase_price NUMERIC (10, 2) NOT NULL,
    note TEXT
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers
);

INSERT INTO customers (first_name, last_name)
VALUES ('John', 'Jorkenson'), ('Millard', 'Filmore'), ('Ted', 'Tedric');

INSERT INTO bikes (code, model, price)
VALUES ('FLY', 'The Flyer' 500), ('HAUL','The Big Haul', 600),
 ('SKIN', 'The Skinny', 700), ('BUD', 'Big Buddy', 800);

 INSERT INTO orders (customer_id)
 VALUES (1), (1), (2), (3);

 INSERT INTO bike_purchases (model, order, purchase_price)
 VALUES ('HAUL', 1, 500), ('HAUL', 2, 500) ('FLY', 2, 500),
 ('HAUL', 3, 600), ('BUD', 4, 800), ('SKIN', 4, 650);
