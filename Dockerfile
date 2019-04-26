FROM centos:7
RUN yum install -y php-fpm php-gd php-mysql php-mbstring php-curl \
    && yum clean all \
    && sed -i 's/127.0.0.1:9000/0.0.0.0:9000/' /etc/php-fpm.d/www.conf \
    && sed -i 's/listen.allowed_clients/;listen.allowed_clients/' /etc/php-fpm.d/www.conf \
    && sed -i 's/display_errors = Off/display_errors = On/' /etc/php.ini \
    && sed -i 's/display_startup_errors = Off/display_startup_errors = On/' /etc/php.ini \
    && sed -i 's/log_errors = Off/log_errors = On/' /etc/php.ini \
    && sed -i 's/;date.timezone =/date.timezone = Asia\/Shanghai/' /etc/php.ini \
    && sed -i 's/max_execution_time = 30/max_execution_time = 300/' /etc/php.ini \
    && sed -i 's/max_input_time = 30/max_input_time = 300/' /etc/php.ini \
    && sed -i 's/post_max_size = 8M/post_max_size = 128M/' /etc/php.ini \
    && sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 128M/' /etc/php.ini \
    && sed -i 's/memory_limit = 128M/memory_limit = 1024M/' /etc/php.ini \
    && sed -i 's/short_open_tag = Off/short_open_tag = On/' /etc/php.ini \
    && mkdir /var/lib/php/session -p \
    && chown apache:apache /var/lib/php/session

EXPOSE 9000

CMD ["php-fpm"]
