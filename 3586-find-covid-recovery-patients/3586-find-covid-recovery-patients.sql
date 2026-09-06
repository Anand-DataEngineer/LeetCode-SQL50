# Write your MySQL query statement below

select
   p.patient_id,
   p.patient_name,
   p.age,
   datediff(min(c1.test_date),min(c.test_date)) as recovery_time
from covid_tests c join covid_tests c1 on c.patient_id = c1.patient_id and c.result = 'Positive' and c1.result = 'Negative' and c.test_date < c1.test_date
join patients p on p.patient_id = c.patient_id 
group by p.patient_id,p.patient_name,p.age
order by recovery_time,patient_name;
