FROM debian:oldstable

ARG DOMAIN_NAME
ARG DB_NAME
ARG WP_ADMIN_USR
ARG WP_ADMIN_PWD
ARG WP_ADMIN_EMAIL
ARG WP_TITLE
ARG WP_USR
ARG WP_PWD
ARG WP_EMAIL

RUN apt update -y

RUN apt install php-fpm php-mysql -y

RUN apt install curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh /script.sh

RUN chmod 777 /script.sh

COPY ./conf/www.conf /

CMD ["/script.sh"]
