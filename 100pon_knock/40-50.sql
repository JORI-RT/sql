-- 43
with
    a
    as
    (
        select
            c.gender_cd ,
            trunc( c.age/10)*10 as era ,
            sum(amount)as amount
        from receipt as r
            inner join customer as c   using(customer_id)
        group by gender_cd , era
    )
select
    a.era,
    coalesce (sum(case when gender_cd = '0' then amount end), 0 )as male, -- 集約関数ならなんでもよい
    coalesce (sum(case when gender_cd = '1' then amount end), 0) as female,
    coalesce (sum(case when gender_cd = '9' then amount end), 0) as unkwon
from a
group by a.era
order by a.era

-- 44
select
    case when c.gender_cd = '0' then '00'
		when c.gender_cd = '1' then '01'
		else '99' end 
	,
    trunc( c.age/10)*10 as era ,
    sum(amount)as amount
from receipt as r
    inner join customer as c   using(customer_id)
group by gender_cd , era

-- 45
select to_char( c.birth_day, 'YYYYMMDD')
from customer c
limit 10

-- 46
select c.customer_id , to_date(c.application_date, 'YYYYMMDD')
from customer c

-- 47
select to_date(cast(r.sales_ymd as varchar), 'YYYYMMDD')
from receipt r 
















