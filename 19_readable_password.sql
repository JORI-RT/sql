-- 平文のパスワード
select case when '1234' = password then 1 else 0 end
from accounts a
where account_id  = 1

-- risk
network傍受
ログにパスワードが漏洩する

identificationとauhoenticationの違い
ハッシュソルト
パスワード＋ソルトー＞暗号化　SHA256

疑問　soltはどこに保存するのがbest practicew

-- solution 
一時パスワードを生成して、有効期限をつける
ー＞　そして、強制的に変更させる


