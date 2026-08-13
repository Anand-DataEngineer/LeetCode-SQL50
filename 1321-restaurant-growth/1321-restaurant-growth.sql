# Write your MySQL query statement below
with overall_cte as (
select distinct
  visited_on,
  Round(sum(amount) over(order by visited_on range between interval 6 day preceding and current row),2) as amount
from customer
)
select
   visited_on,
   amount,
   Round(amount/7,2) as average_amount
from overall_cte
where datediff(visited_on,(select min(visited_on) from Customer)) >5;