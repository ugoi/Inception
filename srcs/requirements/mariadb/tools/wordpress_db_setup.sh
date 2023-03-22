#!/bin/bash

if [ ! -d "/var/lib/mysql/$WP_TITLE" ]
then
    # Substitute environment variables in SQL script
    envsubst < /usr/local/bin/create_wordpress_db.sql > /usr/local/bin/create_wordpress_db.tmp && mv /usr/local/bin/create_wordpress_db.tmp /usr/local/bin/create_wordpress_db.sql

    # Create database and user
    service mysql start
    mysql < /usr/local/bin/create_wordpress_db.sql
    rm -f /usr/local/bin/create_wordpress_db.sql
fi

