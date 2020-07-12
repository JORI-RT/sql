-- 11
select *
from customer c
where customer_id like '%1'
limit 10

--12
select *
from store s
where address like '%横浜%'

--13
select *
from customer c
where status_cd
~ '^[A-F]' limit 10

--14 
select *
from customer c
where status_cd
~ '[1-9]$'

--15 
select *
from customer c
where status_cd
~ '^[A-F].*[1-9]$' limit 10

--16
select *
from store s
where tel_no
~ '[0-9]{3}-[0-9]{3}-[0-9]{4}'

-- 17 
select *
from customer c
order by birth_day  limit 10

-- 18 
select * from customer
c order by birth_day desc limit 10

-- S-019: レシート明細テーブル（receipt）に対し、1件あたりの売上金額（amount）が高い順にランクを付与し、
-- 先頭10件を抽出せよ。項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。
--なお、売上金額（amount）が等しい場合は同一順位を付与するものとする。

select
    customer_id , amount , rank() over (order by amount desc) as ranking
from receipt r
limit 10

-- 20
select
    r.customer_id , r.amount , row_number () over (order by amount desc) as ranking
from (select *
    from receipt r2
    order by customer_id desc ) as r
limit 10


