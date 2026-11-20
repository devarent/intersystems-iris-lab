INSERT INTO SQLUser.customers (name, country) VALUES ('Ada Lovelace', 'GB');
INSERT INTO SQLUser.customers (name, country) VALUES ('Grace Hopper', 'US');
INSERT INTO SQLUser.customers (name, country) VALUES ('Edsger Dijkstra', 'NL');

INSERT INTO SQLUser.orders (customer_id, total) VALUES (1, 120.50);
INSERT INTO SQLUser.orders (customer_id, total) VALUES (1, 80.00);
INSERT INTO SQLUser.orders (customer_id, total) VALUES (2, 240.00);

SELECT c.country, COUNT(*) AS orders, SUM(o.total) AS revenue
FROM SQLUser.customers c
JOIN SQLUser.orders o ON o.customer_id = c.id
GROUP BY c.country
ORDER BY revenue DESC;

SELECT name, total
FROM (
    SELECT c.name, o.total,
           ROW_NUMBER() OVER (PARTITION BY c.id ORDER BY o.total DESC) AS rn
    FROM SQLUser.customers c
    JOIN SQLUser.orders o ON o.customer_id = c.id
) ranked
WHERE rn = 1;
