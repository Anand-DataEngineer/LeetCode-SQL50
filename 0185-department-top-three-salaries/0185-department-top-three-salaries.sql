# Write your MySQL query statement below
with joined_cte as(
    select
       d.name as Department,
       e.name as Employee,
       e.salary as Salary
    from Employee as e join Department as d on e.departmentId = d.id
),
ranked_cte as(
select
   *,
   dense_rank() over(partition by Department order by salary desc) as salary_rank
from joined_cte
)
select
  Department,
  Employee,
  Salary
from ranked_cte
where salary_rank<=3;