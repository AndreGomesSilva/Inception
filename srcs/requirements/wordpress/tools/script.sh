#!/usr/bin/env bash

wp --allow-root config create \
  --dbname="$db_name" \
  --dbuser="$db_user" \
  --dbpass="$db_pwd" \
  --dbhost=mariadb \
  --dbprefix="wp_"

wp core install --allow-root \
  --path=/var/www/wordpress \
  --title="$WP_TITLE" \
  --url=$DOMAIN_NAME \
  --admin_user=$WP_ADMIN_USR \
  --admin_password=$WP_ADMIN_PWD \
  --admin_email=$WP_ADMIN_EMAIL

wp user create --allow-root \
  --path=/var/www/wordpress \
  "$WP_USR" "$WP_EMAIL" \
  --user_pass=$WP_PWD \
  --role='author'

wp theme install astra --activate --allow-root

exec php-fpm7.4 -F
