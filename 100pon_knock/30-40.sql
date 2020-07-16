-- 31
select r.store_cd , stddev_samp (amount)
from receipt r
group by store_cd
order by store_cd limit 5

-- 32
select 
	percentile_cont
(0.25) within group
(order by amount) as amount_25,
	percentile_cont
(0.50) within group
(order by amount) as amount_5,
	percentile_cont
(0.75) within group
(order by amount) as amount_75,
	percentile_cont
(1.00) within group
(order by amount) as amount_100
from receipt r

-- 33
select store_cd, avg(amount )  as avg_amount
from receipt
group by store_cd
having avg(amount ) >= 330

--34
with
    customer_amount
    as
    (
        select
            r2.customer_id,
            sum(r2.amount) as avg_amount_per_cus
        from receipt r2
        where r2.customer_id not like 'Z%'
        group by r2.customer_id
    )
select avg(avg_amount_per_cus)
from customer_amount 

-- 35
with customer_amount
as
(
	select
    r2.customer_id,
    sum(r2.amount) as sum_amount
from receipt r2
where r2.customer_id not like 'Z%'
group by r2.customer_id  
)
select avg(sum_amount)
from customer_amount
where sum_amount >= (select avg(sum_amount)
from customer_amount )
limit 10

-- 36
select r.*, s.store_name
from receipt r
    inner join store s  using (store_cd)
limit 10

-- 37
select
    p.* , c.category_medium_name
from product p
    inner join category c  
using(category_major_cd, category_medium_cd)
limit 10

-- 38
select
    c.customer_id,
    coalesce(sum(r.amount ), 0) as sum_anmount
from customer c
    left outer join receipt r  using(customer_id)
where c.gender_cd = '1'
    and c.customer_id not like 'Z%'
group by c.customer_id
limit 10

-- left join は　left outer jointの省略系らしい

-- 39


-- 40
select count(*)
from store, product p 
	
	