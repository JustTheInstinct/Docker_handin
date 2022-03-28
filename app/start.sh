#!/bin/bash

set -ex

echo "Running Gunicorn"
sed -i "s|___MYSQL_HOST___|${MYSQL_HOST}|" /app/src/backend.conf
envsubst < /app/src/database.js.template > /app/src/config/database.js
#/app/src/wait-for-it.sh ${MYSQL_HOST}:${MYSQL_PORT}

npm start
exec /app/.local/bin/gunicorn web:app -b 0.0.0.0:8000