
select td.customer_id,sum(case when td.transaction_id is null then 1 else 0 end) as count_no_trans
from (select v1.customer_id,t1.transaction_id
from
Visits v1
left join
Transactions t1
on v1.visit_id = t1.visit_id) as td
group by td.customer_id
having count_no_trans >0
