FROM debian:buster

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

ARG WP_URL
ARG WP_TITLE
ARG WP_ADMIN_LOGIN
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL
ARG WP_USER_LOGIN
ARG WP_USER_PASSWORD
ARG WP_USER_EMAIL
ARG MYSQL_ROOT_PASSWORD

# Update packages and install MariaDB server and envsubst
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    mariadb-server \
    gettext-base \
 && rm -rf /var/lib/apt/lists/*

# Expose MariaDB port
EXPOSE 3306

# Copy configuration files and setup script
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/create_wordpress_db.sql /usr/local/bin/
COPY ./tools/wordpress_db_setup.sh /usr/local/bin/

# Set execute permissions for the setup script
RUN chmod +x /usr/local/bin/wordpress_db_setup.sh

# Run the setup script
RUN /usr/local/bin/wordpress_db_setup.sh

# Start MariaDB server
CMD ["mysqld"]
