# Write your MySQL query statement below
with min_date_cte as(
select
   min(visited_on) as min_date
from Customer
),
day_summed_up_cte as(
    select
       visited_on,
       sum(amount) as amount
    from Customer
    group by visited_on
),
overall_cte as (
select
  visited_on,
  Round(sum(amount) over(order by visited_on range between interval 6 day preceding and current row),2) as amount,
  Round(avg(amount) over(order by visited_on range between interval 6 day preceding and current row),2) as average_amount
from day_summed_up_cte
)
select
   visited_on,
   amount,
   average_amount
from overall_cte
where datediff(visited_on,(select min_date from min_date_cte)) >5;