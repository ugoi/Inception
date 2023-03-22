# Use Debian Buster as the base image
FROM debian:buster

# Install required packages
RUN apt-get update \
    && apt-get -y install \
        php7.3 \
        php-mysqli \
        php-fpm \
        curl \
        sendmail

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Create a new user
RUN useradd -ms /bin/bash myuser \
    && usermod -aG www-data myuser

# Copy PHP-FPM configuration file and WordPress startup script to the image
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/wordpress_entrypoint.sh /usr/local/bin/

# Set the ownership and permissions of the WordPress startup script
RUN chown myuser:myuser /usr/local/bin/wordpress_entrypoint.sh \
    && chmod +x /usr/local/bin/wordpress_entrypoint.sh

# Create the directory for PHP-FPM to write its PID file
RUN mkdir -p /run/php/

# Set the entrypoint to be the WordPress startup script
ENTRYPOINT [ "/usr/local/bin/wordpress_entrypoint.sh" ]

# Set the default command to start PHP-FPM in non-daemon mode
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
