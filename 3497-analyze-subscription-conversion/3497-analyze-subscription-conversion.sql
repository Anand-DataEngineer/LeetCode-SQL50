# Write your MySQL query statement below

select
  user_id,
  Round(avg( case when activity_type = 'free_trial' then activity_duration end),2) as trial_avg_duration,
  Round(avg( case when activity_type = 'paid' then activity_duration end),2) as paid_avg_duration
from useractivity
group by user_id having paid_avg_duration is not null and trial_avg_duration is not null
order by user_id asc;