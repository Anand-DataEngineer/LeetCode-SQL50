# Write your MySQL query statement below
SELECT
   tb2.unique_id,
   tb1.name
FROM Employees AS tb1 
LEFT JOIN EmployeeUNI AS tb2 ON tb1.id = tb2.id;