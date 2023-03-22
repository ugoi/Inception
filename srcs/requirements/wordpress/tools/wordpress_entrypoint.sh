#!/bin/bash

# Check if WordPress is already installed, and if not, install it
if [ ! -f /var/www/html/wp-config-sample.php ]; then
	# Download and install WP-CLI
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	chown myuser:myuser /usr/local/bin/wp

	# Set up WordPress
	cd /var/www/html
	chown -R myuser:myuser /var/www/html
	wp core download --allow-root;
	wp config create --allow-root \
		--dbname=${WP_TITLE} \
		--dbuser=${WP_USER_LOGIN} \
		--dbpass=${WP_USER_PASSWORD} \
		--dbhost=${WP_DB_HOST} \
		--dbprefix=${WP_DB_PREFIX} \
		--dbcharset=${WP_DB_CHARSET} \
		--dbcollate=${WP_DB_COLLATE} \
		--skip-check
	wp core install --allow-root \
		--url=${WP_URL} \
		--title=${WP_TITLE} \
		--admin_user=${WP_ADMIN_LOGIN} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root \
		${WP_USER_LOGIN} \
		${WP_USER_EMAIL} \
		--user_pass=${WP_USER_PASSWORD}
fi

# Execute the passed command
exec "$@"
