#!/bin/bash

service mariadb start

mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $db_name;"

mariadb -u root -e "CREATE USER IF NOT EXISTS '${WP_ADMIN_USR}'@'%' IDENTIFIED BY '${WP_ADMIN_PWD}';"

mariadb -u root -e "GRANT ALL PRIVILEGES ON $db_name.* TO '${WP_ADMIN_USR}'@'%';"

mariadb -u root -e "FLUSH PRIVILEGES;"

