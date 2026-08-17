# Write your MySQL query statement below

(select
   u.name as results
from Users as u join MovieRating as mr on u.user_id = mr.user_id
group by u.name
order by count(*) desc, u.name
limit 1)

union all

(select
   m.title as results
from movies as m join MovieRating as mr on m.movie_id = mr.movie_id
where Date_format(mr.created_at,'%Y-%m') like '2020-02'
group by m.title
order by avg(rating) desc, m.title
limit 1);

