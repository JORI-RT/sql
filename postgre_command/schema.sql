--　現在のスキーマを確認
select current_schema()

-- スキーマの所有者を変更
-- スーパーユーザかスキーマの所有者かつcreate権限がないと無理
alter schema schema_name owner to new_owner;

-- schemaの名前を変更
alter schema old_name rename to new_name;


-- テーブルの所有者変更SQL作成
SELECT
    'ALTER TABLE ' || schemaname 
    || '.' || tablename || 
    ' OWNER TO new_user;'
FROM pg_tables
WHERE schemaname='public'

-- schemaの削除
drop schema namea
cascade;

-- スキーマだけ削除とはどういうことか？？　restrict






