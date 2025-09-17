FROM odoo:17.0

# Copy file cấu hình
COPY odoo.conf /etc/odoo/

# Copy custom modules vào container
COPY custom_addons /mnt/custom_addons

# Expose port 80
EXPOSE 8069

# Sử dụng user odoo
USER odoo

# Lệnh khởi chạy chỉ dùng config và addons
CMD ["sh", "-c", "odoo --config=/etc/odoo/odoo.conf --init base --without-demo=all --stop-after-init && odoo --config=/etc/odoo/odoo.conf --addons-path=/mnt/custom_addons,/usr/lib/python3/dist-packages/odoo/addons"]
