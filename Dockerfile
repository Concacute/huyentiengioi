# Dockerfile
FROM odoo:17.0

# Copy file cấu hình vào container
COPY odoo.conf /etc/odoo/

# Expose port 80 để Render có thể mapping
EXPOSE 80

# Sử dụng user mặc định của Odoo image
USER odoo

# Lệnh khởi chạy Odoo
CMD ["odoo", "--config=/etc/odoo/odoo.conf"]
