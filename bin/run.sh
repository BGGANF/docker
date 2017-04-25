docker rm -f mynginx
docker run -d -p 80:80 --name mynginx -v /Users/wing/docker/www:/usr/share/nginx/html -v /Users/wing/docker/config:/etc/nginx/conf.d  nginx
