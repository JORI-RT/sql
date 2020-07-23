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

-- 53
with
    cust
    as
    (
        select
            c.customer_id ,
            case when cast(substring(postal_cd, 0, 4) as integer ) >= 100 and
                cast(substring(c.postal_cd, 0, 4) as integer ) <= 209 then 1 else 0 end as postal_flg,
            c.postal_cd
        from customer c
    ),
    rect
    as
    (
        select
            r.customer_id ,
            sum(r.amount )
        from receipt r
        group by r.customer_id
    )
select
    postal_flg
	, count(*)
from rect
    inner join cust using(customer_id) 
group by postal_flg3

-- 54

