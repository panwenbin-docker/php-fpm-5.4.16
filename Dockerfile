FROM centos:7
RUN yum install -y php-fpm php-gd php-mysql php-mbstring php-curl \
    && yum clean all \
    && sed -i 's/127.0.0.1:9000/0.0.0.0:9000/' /etc/php-fpm.d/www.conf \
    && sed -i 's/listen.allowed_clients/;listen.allowed_clients/' /etc/php-fpm.d/www.conf \
    && sed -i 's/display_errors = Off/display_errors = On/' /etc/php.ini \
    && sed -i 's/display_startup_errors = Off/display_startup_errors = On/' /etc/php.ini \
    && sed -i 's/log_errors = Off/log_errors = On/' /etc/php.ini \
    && sed -i 's/;date.timezone =/date.timezone = Asia/Shanghai/' /etc/php.ini
