CREATE TABLE SQLUser.customers (
    id INTEGER IDENTITY PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    country VARCHAR(2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SQLUser.orders (
    id INTEGER IDENTITY PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES SQLUser.customers(id),
    total NUMERIC(12,2) NOT NULL CHECK (total >= 0),
    ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_orders_customer ON SQLUser.orders(customer_id);
