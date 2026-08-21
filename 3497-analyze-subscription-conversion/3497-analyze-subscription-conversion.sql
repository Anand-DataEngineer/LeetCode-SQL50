# Write your MySQL query statement below
with paiduser_cte as(
select 
    *
from UserActivity 
where user_id in
(select
   distinct user_id
from UserActivity
where activity_type = 'paid'
intersect
select
   distinct user_id
from UserActivity
where activity_type = 'free_trial')
)
select
  user_id,
  Round(avg( case when activity_type = 'free_trial' then activity_duration end),2) as trial_avg_duration,
  Round(avg( case when activity_type = 'paid' then activity_duration end),2) as paid_avg_duration
from paiduser_cte
group by user_id;