select machine_id,round((td.en-td.st)/td.cn ,3)as processing_time
from(
select machine_id,sum(case when activity_type = 'start' then timestamp else 0 end) as st,
sum(case when activity_type = 'end' then timestamp else 0 end) as en,count( distinct process_id) as cn
from Activity
group by machine_id
) as td



