# Write your MySQL query statement below

select
   sign.user_id,
   round(avg(if(confirm.action = 'confirmed',1,0)),2) as confirmation_rate
from signups as sign left join confirmations as confirm on sign.user_id = confirm.user_id
group by sign.user_id;