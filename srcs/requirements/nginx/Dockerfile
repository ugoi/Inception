FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx openssl php-fpm default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY ./conf/default.conf /etc/nginx/sites-enabled/default.conf

CMD ["nginx", "-g", "daemon off;"]
