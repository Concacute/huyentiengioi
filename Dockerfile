# Sử dụng image chính thức của Odoo
FROM odoo:17.0

# Thiết lập các biến môi trường KẾT NỐI DATABASE CỦA BẠN
ENV DB_NAME="huyen_tien_gioi"
ENV DB_HOST="dpg-d352do15pdvs73bclae0-a.singapore-postgres.render.com"
ENV DB_PORT="5432"
ENV DB_USER="huyen_tien_gioi_user"
ENV DB_PASSWORD="voW3RxiatcywjAceUMNB5H8QiaNsxt6I"
ENV PGHOST="dpg-d352do15pdvs73bclae0-a.singapore-postgres.render.com"

# Người dùng mặc định của image Odoo là 'odoo'
USER odoo

# Copy script khởi động vào
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Thiết lập lệnh khởi động
CMD ["/start.sh"]
