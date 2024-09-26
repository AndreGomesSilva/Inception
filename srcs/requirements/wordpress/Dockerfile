FROM debian:oldstable

WORKDIR /var/www/wordpress/

ARG DOMAIN_NAME
ARG DB_NAME
ARG WP_ADMIN_USR
ARG WP_ADMIN_PWD
ARG WP_ADMIN_EMAIL
ARG WP_TITLE
ARG WP_USR
ARG WP_PWD
ARG WP_EMAIL

RUN apt update -y && apt upgrade -y

RUN apt install wget -y

RUN apt install php7.4 php-fpm php-mysql -y

RUN mkdir /run/php

RUN apt install mariadb-client wordpress -y && \
rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/wordpress && \
chmod 755 /var/www/wordpress

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x /usr/local/bin/wp && \
wp core download --allow-root --path=/var/www/wordpress

COPY ./tools/script.sh /tmp/script.sh

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod 777 /tmp/script.sh

CMD ["/tmp/script.sh"]
