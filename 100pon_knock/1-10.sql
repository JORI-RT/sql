-- 1
select *
from receipt r
limit 10
--S-002: レシート明細のテーブル（receipt）から売上日（sales_ymd）、
-- 顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示させよ。
select
    r.sales_ymd ,
    r.customer_id ,
    r.product_cd ,
    r.amount
from receipt r
limit 10
--3
select
    r.sales_ymd as sales_date,
    r.customer_id ,
    r.product_cd ,
    r.amount
from receipt r
limit 10

--4
select
    r.sales_ymd as sales_date,
    r.customer_id ,
    r.product_cd ,
    r.amount
from receipt r
where customer_id = 'CS018205000001'
limit 10

--5
select
    r.sales_ymd as sales_date,
    r.customer_id ,
    r.product_cd ,
    r.amount
from receipt r
where customer_id = 'CS018205000001' and amount  >= 1000
limit 10

--6
select
    r.sales_ymd as sales_date,
    r.customer_id ,
    r.product_cd ,
    r.amount
from receipt r
where customer_id = 'CS018205000001'
    and( amount  >= 1000
    or quantity >= 5
)

--7
select
    r.sales_ymd as sales_date,
    r.customer_id ,
    r.product_cd ,
    r.amount
from receipt r
where customer_id = 'CS018205000001'
    and amount between 1000 and 2000

--8
select
    r.sales_ymd as sales_date,
    r.customer_id ,
    r.product_cd ,
    r.amount
from receipt r
where customer_id = 'CS018205000001'
    and product_cd != 'P071401019'

-- 9 
select *
from store
where  (not prefecture_cd = '13' and not floor_area > 900)

-- 10
select *
from store s2
where store_cd  like 'S14%'
limit 10
