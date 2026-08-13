# Write your MySQL query statement below

with ranked_cte as(
   select
      id,
      recordDate,
      temperature,
      LAG(temperature) over(order by recordDate) as prev_date_temp,
      LAG(recordDate) over(order by recordDate) as prev_rec_date
    from weather
)
select
  id
from ranked_cte
where  temperature > prev_date_temp
and prev_rec_date = DATE_SUB(recordDate,Interval 1 day);


