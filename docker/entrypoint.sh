#!/bin/bash

set -e

GID=$(stat -c "%u" /work/app)
usermod -u $GID www-data

if [ "$1" = 'nginx' ]; then

  if [ -z "${NGINX_ROOT+x}" ]; then
    echo 'Environment variable NGINX_ROOT must be set to absolute document root. i.e.: /work/app/public'
    exit 1
  fi

  cat /work/docker/web/nginx.conf.template | sed -e "s|\$NGINX_ROOT|$NGINX_ROOT|" > /etc/nginx/nginx.conf

fi

exec "$@"
