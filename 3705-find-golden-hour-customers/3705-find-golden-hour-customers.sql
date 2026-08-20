# Write your MySQL query statement below

with rated_cte as(
select
    customer_id,
    count(*) as total_orders,
    Round(sum(case when time(order_timestamp) between '11:00:00' and '14:00:00' or time(order_timestamp) between '18:00:00' and '21:00:00'
             then 1 
             else 0
        end)/count(*) * 100 , 0) as peak_hour_percentage,
    Round(avg(order_rating),2) as average_rating,
    sum(case when order_rating is NULL then 0 else 1 end)/count(*) * 100.0 as rated_percentage
from restaurant_orders
group by customer_id
)
select
   rated_cte.customer_id,
   rated_cte.total_orders,
   rated_cte.peak_hour_percentage,
   rated_cte.average_rating
from rated_cte
where total_orders > 2 AND peak_hour_percentage >= 60 AND average_rating >= 4.0 AND rated_percentage >= 50 
order by average_rating desc, customer_id desc; 
   
