FROM odoo:17

USER root

# Cài wkhtmltopdf bản chuẩn (từ Odoo khuyến nghị)
RUN apt-get update && apt-get install -y \
    xfonts-75dpi \
    xfonts-base \
    wget \
    && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb \
    && apt-get install -y ./wkhtmltox_0.12.6-1.buster_amd64.deb \
    && rm -rf /var/lib/apt/lists/* ./wkhtmltox_0.12.6-1.buster_amd64.deb

# Tạo thư mục addons custom
RUN mkdir -p /mnt/extra-addons
VOLUME /mnt/extra-addons

EXPOSE 8069

USER odoo

CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
