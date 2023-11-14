DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    street VARCHAR,
    city VARCHAR,
    zip VARCHAR,
    country VARCHAR
);
\copy customers from './stage-1/data/customers.csv' CSV HEADER

DROP TABLE IF EXISTS stores CASCADE;
CREATE TABLE IF NOT EXISTS stores (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    country VARCHAR
);
\copy stores from './stage-1/data/stores.csv' CSV HEADER

DROP TABLE IF EXISTS drivers CASCADE;
CREATE TABLE IF NOT EXISTS drivers (
    id SERIAL PRIMARY KEY,
    store_id INT REFERENCES stores(id),
    country VARCHAR
);
\copy drivers from './stage-1/data/drivers.csv' CSV HEADER

DROP TABLE IF EXISTS pizzas CASCADE;
CREATE TABLE IF NOT EXISTS pizzas (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    cost INT
);
\copy pizzas from './stage-1/data/available_pizzas.csv' CSV HEADER

DROP TABLE IF EXISTS toppings CASCADE;
CREATE TABLE IF NOT EXISTS toppings (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    cost_per_pizza INT
);
\copy toppings from './stage-1/data/available_toppings.csv' CSV HEADER

DROP TABLE IF EXISTS orders CASCADE;
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date DATE,
    pizza_type INT REFERENCES pizzas(id),
    store_id INT REFERENCES stores(id),
    toppings ARRAY REFERENCES toppings(id)
);
\copy orders from './stage-1/data/orders.csv' CSV HEADER