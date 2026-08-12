# Write your MySQL query statement below

SELECT 
   p.product_name,
   s.year,
   s.price
FROM sales AS S
INNER JOIN product AS P 
ON s.product_id = p.product_id;