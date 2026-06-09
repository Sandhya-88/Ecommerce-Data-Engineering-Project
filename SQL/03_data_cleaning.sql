#ETL Cleaning

--Duplicate check

select
    email,
    count(*)
from customers
group by email
having count(*) > 1;



--NULL value check

select *
from customers
where email is null
   or city is null
   or signup_date is null;


--invalid value check

select *
from products
where price <= 0;