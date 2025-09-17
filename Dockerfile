FROM odoo:17

USER root

# Tạo thư mục addons custom
RUN mkdir -p /mnt/extra-addons
VOLUME /mnt/extra-addons

EXPOSE 8069

USER odoo

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
