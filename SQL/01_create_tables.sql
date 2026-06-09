--customers table
create table customers
(
    customer_id int primary key,
    name varchar(100),
    email varchar(100),
    city varchar(50),
    signup_date date
);




--products table
create table products
(
    product_id int primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10,2)
);




--orders table
create table orders
(
    order_id int primary key,
    customer_id int,
    product_id int,
    order_date date,
    quantity int,

    foreign key (customer_id)
    references customers(customer_id),

    foreign key (product_id)
    references products(product_id)
);



--payments table
create table payments
(
    payment_id int primary key,
    order_id int,
    payment_method varchar(50),
    amount decimal(10,2),
    status varchar(20),

    foreign key (order_id)
    references orders(order_id)
);