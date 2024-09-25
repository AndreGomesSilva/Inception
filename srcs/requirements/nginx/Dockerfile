FROM debian:oldstable

ARG CERTS_KEY
ARG CERTS_CRT

RUN apt update -y && apt upgrade -y

RUN apt install -y nginx && apt install  openssl -y

RUN  openssl req -x509 -sha256 -nodes -newkey rsa:4096 -days 365 -subj "/C=BR/ST=Sao Paulo/O=42SP/OU=Inception/CN=angomes-.42.fr" -keyout ${CERTS_KEY} -out ${CERTS_CRT}

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www
RUN chown -R www-data:www-data /var/www

CMD ["nginx", "-g", "daemon off;"]

