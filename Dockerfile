FROM odoo:17.0

# Copy file cấu hình
COPY odoo.conf /etc/odoo/

# Expose port 80
EXPOSE 80

# Sử dụng user odoo
USER odoo

# Lệnh khởi chạy BUỘC khởi tạo base
CMD ["sh", "-c", "odoo --config=/etc/odoo/odoo.conf --init base --without-demo=all --stop-after-init && odoo --config=/etc/odoo/odoo.conf"]
