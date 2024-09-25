#!/bin/bash

service mariadb start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mariadb -u root -e "CREATE USER IF NOT EXISTS '$WP_ADMIN_USR'@'%' IDENTIFIED BY '$WP_ADMIN_PWD';"

mariadb -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$WP_ADMIN_USR'@'%' IDENTIFIED BY '$WP_ADMIN_PWD';"

mariadb -u root -e "FLUSH PRIVILEGES;"

