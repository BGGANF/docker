docker rm -f `docker ps -qa`
docker run --restart=always --name=approot -v /Users/wing/work:/var/www/html -d busybox echo approot
docker run --restart=always --name=nginx_config_root -v /Users/wing/work/docker/config/nginx:/etc/nginx/conf.d -d busybox echo nginx_config_root
docker run --restart=always --name=nginx_log_root -v /Users/wing/work/docker/log/nginx/:/var/log/nginx -d busybox echo nginx_log_root
docker run --restart=always --name=php_log_root -v /Users/wing/docker/log/php/:/var/log -d busybox echo php_log_root
docker run --restart=always --name=php_config_root -v /Users/wing/work/docker/config/php:/usr/local/etc -d busybox echo php_config_root
docker run --restart=always --name=php-fpm  --volumes-from approot --volumes-from php_config_root -d php:7.1.0-fpm
docker run --restart=always --name=nginx --volumes-from approot --volumes-from nginx_config_root --volumes-from nginx_config_root --volumes-from nginx_log_root --link php-fpm:php -p 80:80 -d nginx
