FROM debian:oldstable

RUN apt update -y

RUN apt install php-fpm php-mysql -y

RUN apt install curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh /script.sh

#RUN chmod 777 /script.sh

#COPY ./conf/www.conf /

#CMD ["/script.sh"]
