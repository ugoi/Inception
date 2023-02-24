FROM	debian:buster

# Install Nginx and OpenSSL
RUN apt-get update && \
    apt-get install -y nginx openssl curl && \
    rm -rf /var/lib/apt/lists/*

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/sdukic.crt \
       -keyout /etc/nginx/ssl/sdukic.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=sdukic/CN=sdukic/"

# COPY ./conf/nginx.conf /etc/nginx/conf.d
COPY requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY requirements/nginx/index.html /usr/share/nginx/html/index.html
COPY requirements/nginx/style.css /usr/share/nginx/html/style.css


# # nginx config
RUN mkdir -p /run/nginx

# #the only port allowed
EXPOSE	80 443

# # Start nginx
CMD ["nginx", "-g", "daemon off;"]


