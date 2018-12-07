FROM centos:7
RUN yum install php-fpm php-gd php-mysql php-mbstring php-curl \
    && yum clean all
