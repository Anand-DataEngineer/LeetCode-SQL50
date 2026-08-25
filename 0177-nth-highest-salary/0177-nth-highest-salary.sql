CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      with ranked_cte as(
         select 
            *,
            dense_rank() over(order by salary desc) as rnk
        from Employee
      )
      select
         distinct salary 
      from ranked_cte
      where rnk = N

  );
END