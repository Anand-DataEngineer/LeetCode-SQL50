# Write your MySQL query statement below
select
   reading_sessions.book_id,
   books.title,
   books.author,
   books.genre,
   books.pages,
   max(reading_sessions.session_rating) - min(reading_sessions.session_rating) as rating_spread,
   Round(avg(case when reading_sessions.session_rating <=2 or reading_sessions.session_rating >=4
            then 1 else 0 end),2) as polarization_score
from books join reading_sessions on books.book_id = reading_sessions.book_id
group by reading_sessions.book_id 
having count(*) > 4
and
sum(case when reading_sessions.session_rating <=2 then 1 else 0 end) > 0 
and
sum(case when reading_sessions.session_rating >=4 then 1 else 0 end) > 0
and 
polarization_score >= 0.6
order by polarization_score desc, books.title desc;