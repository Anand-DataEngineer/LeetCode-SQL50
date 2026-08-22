# Write your MySQL query statement below

with ranked_cte as(
select
  student_id,
  subject,
  first_value(score) over(partition by student_id,subject order by exam_date asc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as first_score,
  last_value(score) over(partition by student_id,subject order by exam_date asc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)  as latest_score
from Scores
)
select
  distinct
  *
from ranked_cte
where first_score < latest_score;
