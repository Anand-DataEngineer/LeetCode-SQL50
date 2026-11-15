# Write your MySQL query statement below

select
   id,
   Sum(case when month = 'Jan' then revenue end) as Jan_Revenue,
   Sum(case when month = 'Feb' then revenue end) as Feb_Revenue,
   Sum(case when month = 'Mar' then revenue end) as Mar_Revenue,
   Sum(case when month = 'Apr' then revenue end) as Apr_Revenue,
     Sum(case when month = 'May' then revenue end) as May_Revenue,
     Sum(case when month = 'Jun' then revenue end) as Jun_Revenue,
     Sum(case when month = 'Jul' then revenue end) as Jul_Revenue,
     Sum(case when month = 'Aug' then revenue end) as Aug_Revenue,
     Sum(case when month = 'Sep' then revenue end) as Sep_Revenue,
     Sum(case when month = 'Oct' then revenue end) as Oct_Revenue,
     Sum(case when month = 'Nov' then revenue end) as Nov_Revenue,
     SUm(case when month = 'Dec' then revenue end) as Dec_Revenue
from Department
group by id;