--Query Optimization
-- Q1: Analyze query performance before adding index

explain analyze
select *
from orders
where customer_id = 1;

-- Q2: Create index to improve customer search performance

create index idx_orders_customer_id
on orders(customer_id);

-- Q3: Analyze query performance after adding index

explain analyze
select *
from orders
where customer_id = 1;