-- Q1: What is the total revenue generated from successful payments?

select
    sum(amount) as total_revenue
from payments
where status = 'Success';



-- Q2: Find top customers based on total spending

select
c,customer_id,
c.name,
sum(p.amount) as total_spent
from customers c
join orders o
using (customer_id)
join payments p
using(order_id)
where p.status = 'Success'
group by c.customer_id, c.name
order by total_spent desc;



-- Q3: Rank customers based on total spending

select
c.customer_id,
c.name,
sum(p.amount) as total_spent,
rank() over(order by sum(p.amount) desc)
as customer_rank
from customers c
join orders o
using(customer_id)
join payments p
using(order_id)
where p.status = 'Success'
group by c.customer_id, c.name;



-- Q4: Calculate monthly revenue

with monthly_sales as
(select
extract(month from o.order_date) as month,
sum(p.amount) as revenue
from orders o
join payments p
using(order_id)
where p.status = 'Success'
group by extract(month from o.order_date))
select
month,
revenue
from monthly_sales
order by month;



-- Q5: Find top selling products by quantity

select p.product_id,
p.product_name,
sum(o.quantity) as total_quantity_sold
from products p
join orders o
using(product_id)
group by p.product_id, p.product_name
order by total_quantity_sold desc;
 


--Q6: Find revenue by product category

select
p.category,
sum(pm.amount) as total_revenue
from products p
join orders o
using(product_id)
join payments pm
using(order_id)where pm.status = 'Success'
group by p.category
order by total_revenue desc;



--Q7: Classify customers based on how much they spent.

select
c.name,
sum(pm.amount) as total_spent,
case
when sum(pm.amount) > 50000 then 'High Value'
when sum(pm.amount) between 20000 and 50000 then 'Medium Value'
else 'Low Value'
end as customer_value
from customers c
join orders o
using(customer_id)
join payments pm
using(order_id)
where pm.status = 'Success'
group by c.name;



--Q8: Which customers placed more than one order?

select
c.name,
count(o.order_id) as total_orders
from customers c
join orders o
using(customer_id)
group by c.name
having count(order_id) > 1;