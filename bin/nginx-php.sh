docker rm -f nginx-php
docker rm -f mysql
docker rm -f redis
docker run --name=redis -p 6379:6379 -d redis
docker run --name=mysql -p 3307:3306 -v /Users/wing/work/docker/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=wing-root -d mysql:5.6
docker run --name=nginx-php --link mysql:mysql.db --link redis:redis.db -p 80:80 -v /Users/wing/work:/app -v /Users/wing/work/docker/config/nginx-php/nginx:/opt/docker/etc/nginx -d webdevops/php-nginx
