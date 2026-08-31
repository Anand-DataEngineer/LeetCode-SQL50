# Write your MySQL query statement below
select
   customer_id
from customer_transactions
group by customer_id
having sum(case when transaction_type = 'purchase' then 1 else 0 end) > 2 
AND  sum(case when transaction_type = 'refund' then 1 else 0 end)/count(*) < 0.2 
AND datediff(max(transaction_date),min(transaction_date)) >=30; 