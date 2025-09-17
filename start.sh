#!/bin/bash
set -e

# Lệnh khởi chạy Odoo với các biến môi trường ĐÃ ĐƯỢC ĐỊNH NGHĨA
exec ./odoo-bin \
    --database="$DB_NAME" \
    --db_host="$DB_HOST" \
    --db_port="$DB_PORT" \
    --db_user="$DB_USER" \
    --db_password="$DB_PASSWORD" \
    --http-interface=0.0.0.0 \
    --http-port=80 \
    --proxy-mode \
    --without-demo=all
