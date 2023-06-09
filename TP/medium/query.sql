-- Write a query to retrieve the customer name and total revenue generated by each customer for the orders placed in the year 2022.
SELECT c.customer_name, SUM(oi.quantity * p.unit_price) AS total_revenue
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.order_date >= '2022-01-01' AND o.order_date < '2023-01-01'
GROUP BY c.customer_name;

-- Write a query to retrieve the top 5 customers who generated the highest revenue in the year 2022.


SELECT c.customer_name, SUM(oi.quantity * p.unit_price) AS total_revenue
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.order_date >= '2022-01-01' AND o.order_date < '2023-01-01'
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Write a query to retrieve the product name and the total quantity of each product sold in the year 2022.
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.order_date >= '2022-01-01' AND o.order_date < '2023-01-01'
GROUP BY p.product_name;


-- Write a query to retrieve the customer name, order date, and the total revenue generated by each order for the orders placed in the year 2022.

SELECT c.customer_name, o.order_date, SUM(oi.quantity * p.unit_price) AS total_revenue
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.order_date >= '2022-01-01' AND o.order_date < '2023-01-01'
GROUP BY c.customer_name, o.order_date;

--  Write a query to find the top 5 customers who made the most orders in the past 24 months.

SELECT customers.customer_name, COUNT(DISTINCT orders.order_id) AS total_orders
FROM customers
JOIN orders ON orders.customer_id = customers.customer_id
WHERE orders.order_date >= DATE_SUB(NOW(), INTERVAL 24 MONTH)
GROUP BY customers.customer_name
ORDER BY total_orders DESC
LIMIT 5;
;

--Return the total revenue for each customer in descending order, including customers with no orders.
SELECT c.customer_name, COALESCE(SUM(oi.quantity * p.unit_price), 0) AS total_revenue
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;
--https://docs.snowflake.com/fr/sql-reference/functions/coalesce

-- Calculate the running total of revenue for each customer, based on the order date, using a window function.
SELECT orders.order_date, SUM(order_items.quantity * order_items.unit_price) OVER (PARTITION BY orders.customer_id ORDER BY orders.order_date) AS running_total
FROM orders
JOIN order_items ON order_items.order_id = orders.order_id
ORDER BY orders.customer_id, orders.order_date;