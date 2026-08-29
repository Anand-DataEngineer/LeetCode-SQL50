# Write your MySQL query statement below

select
   u.name,
   sum(t.amount) as balance
from Transactions t join users u on t.account = u.account
group by u.name having balance > 10000;