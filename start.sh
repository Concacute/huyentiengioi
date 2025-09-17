#!/bin/bash
set -e

# IN RA BIẾN MÔI TRƯỜNG ĐỂ KIỂM TRA (DEBUG)
echo "=== DEBUG: Environment Variables ==="
echo "DB_NAME: $DB_NAME"
echo "DB_HOST: $DB_HOST"
echo "DB_PORT: $DB_PORT"
echo "DB_USER: $DB_USER"
echo "DB_PASSWORD: $DB_PASSWORD"
echo "==================================="

# Lệnh khởi chạy Odoo
exec ./odoo-bin \
    --database="$DB_NAME" \
    --db_host="$DB_HOST" \
    --db_port="$DB_PORT" \
    --db_user="$DB_USER" \
    --db_password="$DB_PASSWORD" \
    --http-interface=0.0.0.0 \
    --http-port=80 \
    --proxy-mode \
    --without-demo=all \
    --data-dir=/var/lib/odoo
