-- テーブルの件数を表示

SELECT relname,
       n_live_tup
FROM pg_catalog.pg_stat_user_tables
WHERE schemaname = 'public'