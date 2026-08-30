# Write your MySQL query statement below
select
    activity_date as day,
    count(distinct user_id) as active_users
from Activity
where activity_date > DATE_SUB('2019-07-27', interval 30 day) and activity_date <= '2019-07-27' AND activity_type in ('open_session', 'end_session', 'scroll_down', 'send_message')
group by activity_date;