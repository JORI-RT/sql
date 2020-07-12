-- 21
select count(*)
from receipt r

-- 22
select count(distinct customer_id )
from receipt r

-- 23
SELECT store_cd
    , SUM(amount) as amount
    , SUM(quantity) as quantity
FROM receipt
group by store_cd

--24
select customer_id 
	, max(r.sales_ymd )
FROM receipt as r
group by customer_id

--25
select customer_id 
	, min(r.sales_ymd )
FROM receipt as r
group by customer_id

--26
select customer_id 
	, min(r.sales_ymd )
	, max(r.sales_ymd )
FROM receipt as r
group by customer_id
having min(r.sales_ymd ) <> max(r.sales_ymd )
limit 10

-- 27
select r.store_cd , avg(r.amount)as avg_am
from receipt r
group by r.store_cd
order by avg(r.amount ) desc
limit 5

-- 28
select r
.store_cd , percentile_cont
(0.5) within group
(order by amount) 
from  receipt r 
group by r.store_cd 
order by avg
(r.amount ) desc
limit 5

-- 29
select store_cd , mode() within group(order by product_cd)
from receipt r2
group by store_cd

-- 30
SELECT store_cd, var_samp(amount) as vars_amount
FROM receipt
GROUP BY store_cd
ORDER BY vars_amount desc
LIMIT 5