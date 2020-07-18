select *
from accounts a

-- データ準備
INSERT INTO public.accounts
    (account_name, first_name, last_name, email, password_hash, hourly_rate)
VALUES('jingle', 'rio', 'jingu', 'aa@bb', '1234', 0);

INSERT INTO public.accounts
    (account_name, first_name, last_name, email, password_hash, hourly_rate)
VALUES('bekkamu', 'kazuki', 'isobe', 'aa@bb', '1234', 0);

INSERT INTO public.accounts
    (account_name, first_name, last_name, email, password_hash, hourly_rate)
VALUES('jori', 'ryo', 'takaki', 'aa@bb', '1234', 0);

-- firstNameとlastNameを連結する
select
    a.first_name || ' ' || a.last_name
from accounts a

-- ミドルネームをつけられるようにする要件が追加された
alter table accounts add column middle_initial CHAR
(2)
-- 以下SQLでは期待とことなった middle_initialがnullの場合、全体がnullになってしまった
select
    a.first_name || ' ' || a.middle_initial || ' ' || a.last_name
from accounts a

update accounts  set middle_initial = 'MM' where account_id  = 1

-- NULLに何を足してもunkonwn
-- NULLと比較すると結果はNULLなので何も表示されない
select *
from accounts a
where middle_initial <> NULL

-- middle_initial がnullの行は評価結果がnullになるのでかえされない
select *
from accounts a
where middle_initial <> 'MM'
-- is distinct from をつかえばnullが適切に評価される
select *
from accounts a
where middle_initial
is distinct from 'MM'

-- coalesceをつかえば、左の引数がnullだったら右の引数が返される
select
    a.first_name ||coalesce( ' ' || a.middle_initial || ' ', ' ' )|| a.last_name
from accounts a 

