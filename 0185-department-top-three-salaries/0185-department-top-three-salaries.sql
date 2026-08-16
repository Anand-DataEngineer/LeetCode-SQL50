# Write your MySQL query statement below
with joined_cte as(
    select
       d.name as Department,
       e.name as Employee,
       e.salary as Salary,
       dense_rank() over(partition by d.name order by e.salary desc) as salary_rank
    from Employee as e join Department as d on e.departmentId = d.id
)
select
  Department,
  Employee,
  Salary
from joined_cte
where salary_rank<=3;