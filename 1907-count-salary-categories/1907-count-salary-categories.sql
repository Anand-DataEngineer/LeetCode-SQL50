# Write your MySQL query statement below
with category_cte as(
    select
     case 
         when income < 20000 then "Low Salary" 
         when income > 50000 then "High Salary"
         else "Average Salary"
     end as category
    from Accounts
),
counts_cte as(
select
  category,
  count(*) as accounts_count
from category_cte
group by category
)
select
  c.category,
  Coalesce(counts_cte.accounts_count,0) as accounts_count
from (
    select "Low Salary" as category
    union
    select "High Salary" as category
    union
    select "Average Salary" as category
) as c
left join counts_cte on c.category = counts_cte.category
order by counts_cte.accounts_count desc;