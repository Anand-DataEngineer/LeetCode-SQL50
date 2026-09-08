# Write your MySQL query statement below
with next_date_cte as(
    select
      player_id,
      event_date,
      row_number() over(partition by player_id order by event_date) as rnk,
      lead(event_date) over(partition by player_id order by event_date) as next_event_date
    from Activity
)
select
  round(
    count(case when datediff(next_event_date,event_date) = 1 then 1 end)
    / count(*)
    ,2)
  as fraction
from next_date_cte
where rnk=1;


  