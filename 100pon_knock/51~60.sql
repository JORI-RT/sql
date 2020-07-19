-- 51
SELECT
    TO_CHAR(EXTRACT(day FROM TO_TIMESTAMP(sales_epoch)), 'FM00') as sales_month,
    receipt_no, receipt_sub_no
FROM receipt LIMIT
10;

-- 52
select r.customer_id , sum(amount) as amount ,
    case when sum(amount)>2000 then 1 else 0 end
from receipt r
where customer_id not like 'Z%'
group by customer_id
limit 10

--53
