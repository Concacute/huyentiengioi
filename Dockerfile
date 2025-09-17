FROM python:3.11-slim

# Cài các gói cần thiết
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    xfonts-75dpi \
    xfonts-base \
    wget \
    curl \
    && wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb \
    && apt-get install -y ./wkhtmltox_0.12.6-1.buster_amd64.deb \
    && rm -rf /var/lib/apt/lists/* ./wkhtmltox_0.12.6-1.buster_amd64.deb

# Tạo user Odoo
RUN useradd -ms /bin/bash odoo

# Tạo thư mục cho Odoo
WORKDIR /odoo

# Clone Odoo 17
RUN git clone --depth 1 --branch 17.0 https://github.com/odoo/odoo.git .

# Cài đặt requirements
RUN pip install --no-cache-dir -r requirements.txt

# Tạo thư mục addons ngoài
RUN mkdir -p /mnt/extra-addons && chown -R odoo:odoo /mnt/extra-addons

# Copy file config
COPY odoo.conf /etc/odoo/odoo.conf
RUN chown -R odoo:odoo /etc/odoo

USER odoo

EXPOSE 8069

CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "-d", "huyen_tien_gioi", "-i", "base"]
