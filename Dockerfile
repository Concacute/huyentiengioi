FROM odoo:17

USER root

# Chỉ tạo thư mục addons, không cài wkhtmltopdf
RUN mkdir -p /mnt/extra-addons
VOLUME /mnt/extra-addons

EXPOSE 8069

USER odoo

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
