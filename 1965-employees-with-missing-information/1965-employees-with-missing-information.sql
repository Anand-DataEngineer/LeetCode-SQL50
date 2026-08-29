# Write your MySQL query statement below

select
   employee_id
from(
select
   employee_id
from employees
union all
select
   employee_id
from Salaries
) as union_emp group by employee_id having count(*) < 2 order by employee_id asc;

