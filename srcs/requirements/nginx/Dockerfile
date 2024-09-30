FROM debian:oldstable

ARG CERTS_KEY
ARG CERTS_CRT

RUN apt update -y && apt upgrade -y

RUN apt install nginx openssl gettext-base -y

RUN  openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -subj "/C=BR/ST=Sao Paulo/O=42SP/OU=Inception/CN=angomes.42.fr" -keyout ${CERTS_KEY} -out ${CERTS_CRT}
 
COPY ./conf/nginx.conf.template /etc/nginx/conf.d

COPY ./tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh

RUN chmod 755 /var/www
RUN chown -R www-data:www-data /var/www

CMD ["/tmp/script.sh"]

