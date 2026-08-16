# Write your MySQL query statement below
select id,
count(*) as num from 
(
  select
     accepter_id as id from requestaccepted
  union all
  select
     requester_id as id from requestaccepted
) AS all_friends
group by id
order by num desc
limit 1;