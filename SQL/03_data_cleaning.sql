#ETL Cleaning

--Duplicate check
SELECT
    email,
    COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;



--NULL value check
SELECT *
FROM customers
WHERE email IS NULL
   OR city IS NULL
   OR signup_date IS NULL;


--Invalid value check
SELECT *
FROM products
WHERE price <= 0;