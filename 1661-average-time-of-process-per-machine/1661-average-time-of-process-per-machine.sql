# Write your MySQL query statement below

# machine_id , process_id , process_time
with start_cte as (
    select
       machine_id,
       timestamp as end_timestamp,
       lag(timestamp) over(partition by machine_id,process_id order by timestamp) as start_timestamp
    from Activity
)
select
    machine_id,
    Round(Avg(end_timestamp - start_timestamp),3) as processing_time
from start_cte
where start_timestamp is not null
group by machine_id;
