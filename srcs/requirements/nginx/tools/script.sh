#!/bin/sh

envsubst '${CERTS_KEY} ${CERTS_CRT}' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
