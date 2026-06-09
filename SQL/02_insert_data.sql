INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(1, 'Rahul', 'rahul@gmail.com', 'Delhi', '2025-01-10'),
(2, 'Priya', 'priya@gmail.com', 'Mumbai', '2025-01-15'),
(3, 'Aman', 'aman@gmail.com', 'Bangalore', '2025-02-01'),
(4, 'Sneha', 'sneha@gmail.com', 'Kolkata', '2025-02-10');



INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile Phone', 'Electronics', 25000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Keyboard', 'Accessories', 2000);



INSERT INTO orders
(order_id, customer_id, product_id, order_date, quantity)
VALUES
(5001, 1, 101, '2025-03-01', 1),
(5002, 2, 102, '2025-03-02', 2),
(5003, 3, 103, '2025-03-05', 3),
(5004, 4, 104, '2025-03-10', 5);



INSERT INTO payments
(payment_id, order_id, payment_method, amount, status)
VALUES
(9001, 5001, 'UPI', 55000, 'Success'),
(9002, 5002, 'Card', 50000, 'Success'),
(9003, 5003, 'Cash', 9000, 'Pending'),
(9004, 5004, 'UPI', 10000, 'Success');