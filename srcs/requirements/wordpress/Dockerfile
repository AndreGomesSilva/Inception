FROM debian:bullseye

RUN apt update -y

RUN apt install php-fpm php-mysql -y

RUn apt install curl -y

COPY ./tools/script.sh /

COPY ./tools/wp-config.php /

CMD [ "/script.sh" ]
