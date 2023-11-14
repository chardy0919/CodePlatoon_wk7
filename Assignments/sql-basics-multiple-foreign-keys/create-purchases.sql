/* Create the purchases table */
CREATE TABLE purchases (
    id SERIAL PRIMARY KEY,
    item_id INTEGER REFERENCES items(id),
    quantity INTEGER,
    customer_id INTEGER REFERENCES customers(id)
);