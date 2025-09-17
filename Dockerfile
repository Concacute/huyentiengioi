FROM odoo:17

# Cài thêm package nếu cần (ví dụ wkhtmltopdf)
RUN apt-get update && apt-get install -y \
    wkhtmltopdf \
    && rm -rf /var/lib/apt/lists/*

# Tạo thư mục addons custom
RUN mkdir -p /mnt/extra-addons
VOLUME /mnt/extra-addons

# Expose port Odoo
EXPOSE 8069

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
