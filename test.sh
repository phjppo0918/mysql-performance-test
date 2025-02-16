mysqlslap --user=root \
 --password=1234 \
 --host=127.0.0.1 \
 --concurrency=120 \
 --iterations=50 \
 --delimiter=";" \
 --create=./test-create.sql \
--query=./test-query.sql \
--create-schema=test \
--verbose
