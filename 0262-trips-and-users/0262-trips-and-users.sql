# Write your MySQL query statement below

select
   request_at as Day,
   Round((Sum(case 
       when status = 'cancelled_by_driver' then 1
       when status = 'cancelled_by_client' then 1
       else 0 
       end)
    / count(*)),2) as 'Cancellation Rate'
from Trips as t join users as c on t.client_id = c.users_id
join users as d on t.driver_id = d.users_id
where c.banned = 'No' AND d.banned = 'No' AND request_at between "2013-10-01" AND "2013-10-03"
group by request_at;
