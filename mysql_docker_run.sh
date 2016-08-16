docker run --name xalg-mysql \
  --restart=always \
  -v ~/docker-bin/mysql-docker/conf:/etc/mysql/conf.d \
  -v ~/docker-bin/dumps:/docker-entrypoint-initdb.d \
  --volumes-from mysql_data \
  -e MYSQL_ROOT_PASSWORD='' \
  --env-file=env_file \
  -d mysql:5.6
