#!/bin/sh
CONFIG_FILE="/etc/nginx/conf.d/default.conf"

# Check if the config file already exists and contains the correct certificate paths
if grep -q "${CERTS_KEY}" "${CONFIG_FILE}" && grep -q "${CERTS_CRT}" "${CONFIG_FILE}"; then
    echo "Nginx configuration already contains the certificate paths. Skipping envsubst."
else
    echo "Nginx configuration does not exist or does not contain the certificate paths. Running envsubst."
    envsubst '${CERTS_KEY} ${CERTS_CRT}' < /etc/nginx/conf.d/nginx.conf.template > "${CONFIG_FILE}"
fi

nginx -g 'daemon off;'
