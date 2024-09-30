#!/usr/bin/env bash

wp --allow-root config create --dbname="$DB_NAME" --dbuser="$ADMIN_USR" --dbpass="$ADMIN_PWD"  --dbhost=mariadb --dbprefix="wp_"

wp core install --allow-root --path=/var/www/html --title="$TITLE" --url=$DOMAIN_NAME --admin_user=$ADMIN_USR --admin_password=$ADMIN_PWD --admin_email=$ADMIN_EMAIL

wp user create --allow-root --path=/var/www/html "$USR_NAME" "$USR_EMAIL" --user_pass=$USR_PWD  --role='author'

wp --allow-root theme install astra
wp theme activate astra --allow-root

exec php-fpm7.4 -F
