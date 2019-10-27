#!/usr/bin/env bash

TAR_FILE=latest.tar.gz
AUTH_KEYS_FILE=wp-config-auth-keys.php

mkdir -p public || exit
cd public || exit
curl https://wordpress.org/${TAR_FILE} -o ${TAR_FILE}
tar xf ${TAR_FILE} --strip 1
# Check if auth keys have been setup already. If not, download new ones.
if ! grep -q "define(" "${AUTH_KEYS_FILE}"; then
    curl https://api.wordpress.org/secret-key/1.1/salt/ >> ${AUTH_KEYS_FILE}
fi
rm ${TAR_FILE}
