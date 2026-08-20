# Write your MySQL query statement below


select
    customer_id,
    count(*) as total_orders,
    Round(avg(case when time(order_timestamp) between '11:00:00' and '14:00:00' or time(order_timestamp) between '18:00:00' and '21:00:00'
             then 1 
             else 0
        end) * 100 , 0) as peak_hour_percentage,
    Round(avg(order_rating),2) as average_rating
from restaurant_orders
group by customer_id 
having total_orders > 2 AND
       peak_hour_percentage >= 60 AND
       average_rating >= 4.0 AND
       count(order_rating)/count(*) >= 0.5
order by average_rating desc, customer_id desc;

   
