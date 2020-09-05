-- lockを確認

SELECT *
FROM pg_catalog.pg_stat_activity
WHERE datname = 'dbname'
    AND wait_event_type = 'Lock' ;

-- process kill

SELECT pg_terminate_backend(pid)
FROM pg_catalog.pg_stat_activity
WHERE datname = 'dbname'
    AND pid <> pg_backend_pid();