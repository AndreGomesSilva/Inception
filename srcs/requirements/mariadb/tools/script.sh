#!/usr/bin/env bash

service mariadb start

mariadb -u root -e \
  "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
  CREATE USER '${ADMIN_USR}'@'%' IDENTIFIED BY '${ADMIN_PWD}'; \
  GRANT ALL ON ${DB_NAME}.* TO '${ADMIN_USR}'@'%' IDENTIFIED BY '${ADMIN_PWD}'; \
  FLUSH PRIVILEGES;"
