INSERT INTO customers VALUES (1, 'John Doe', '123 Main St', 'New York');
INSERT INTO customers VALUES (2, 'Jane Smith', '456 Oak St', 'Chicago');
INSERT INTO customers VALUES (3, 'Bob Johnson', '789 Elm St', 'Los Angeles');

INSERT INTO orders VALUES (1, '2022-01-01', 1);
INSERT INTO orders VALUES (2, '2022-01-15', 1);
INSERT INTO orders VALUES (3, '2022-02-01', 2);
INSERT INTO orders VALUES (4, '2022-02-15', 2);
INSERT INTO orders VALUES (5, '2022-03-01', 3);
INSERT INTO orders VALUES (6, '2022-03-15', 3);

INSERT INTO products VALUES (1, 'Product A', 10.00);
INSERT INTO products VALUES (2, 'Product B', 20.00);
INSERT INTO products VALUES (3, 'Product C', 30.00);

INSERT INTO order_items VALUES (1, 1, 2, 10.00);
INSERT INTO order_items VALUES (1, 2, 1, 20.00);
INSERT INTO order_items VALUES (2, 3, 3, 30.00);
INSERT INTO order_items VALUES (3, 1, 4, 10.00);
INSERT INTO order_items VALUES (3, 2, 2, 20.00);
INSERT INTO order_items VALUES (4, 3, 1, 30.00);
INSERT INTO order_items VALUES (5, 1, 5, 10.00);
INSERT INTO order_items VALUES (6, 2, 2, 20.00);