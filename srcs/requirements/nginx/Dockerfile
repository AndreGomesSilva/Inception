FROM debian:oldstable

#ARG CERTS_KEY
#ARG CERTS_CRT

RUN apt update -y && apt upgrade -y

RUN apt install nginx openssl -y

RUN  openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -subj "/C=BR/ST=Sao Paulo/O=42SP/OU=Inception/CN=angomes.42.fr" -keyout /etc/ssl/private/private.key -out /etc/ssl/certs/certificate.crt
 
COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www
RUN chown -R www-data:www-data /var/www

CMD ["nginx", "-g", "daemon off;"]

