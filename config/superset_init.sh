#!/bin/bash

set -e

echo ">>> Upgrading database..."
superset db upgrade

echo ">>> Creating admin user..."
superset fab create-admin \
  --username "$ADMIN_USERNAME" \
  --firstname Superset \
  --lastname Admin \
  --email "$ADMIN_EMAIL" \
  --password "$ADMIN_PASSWORD"

echo ">>> Initializing roles and permissions..."
superset init

echo ">>> Starting server..."
/bin/sh -c /usr/bin/run-server.sh
