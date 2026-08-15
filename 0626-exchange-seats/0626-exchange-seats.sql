# Write your MySQL query statement below

select
 case when ID%2 = 0 then ID-1 
      when id = (select max(id) from seat) then ID
      when ID%2 = 1 then ID+1
 end as id,student
from seat
order by id;