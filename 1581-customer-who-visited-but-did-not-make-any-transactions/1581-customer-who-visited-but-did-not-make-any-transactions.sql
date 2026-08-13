# Write your MySQL query statement below

#select
#    tb1.customer_id,
#    count(tb1.customer_id) as count_no_trans
#from visits as tb1 left join transactions as tb2 on tb1.visit_id = tb2.visit_id
#where transaction_id is null
#group by tb1.customer_id;

select
    customer_id,
    count(customer_id) as count_no_trans
from visits 
where visit_id not in 
    (select distinct(visit_id) from transactions)
group by customer_id;
   