FROM centos:centos7
MAINTAINER Leonel Baer <leonel@lysender.com>

# Install packages
RUN yum -y update &&  yum clean all
RUN yum -y install epel-release && yum clean all

RUN yum -y install supervisor \
    git \
    bind-utils \
    pwgen \
    psmisc \
    net-tools \
    hostname \
    curl \
    curl-devel \
    sqlite \
    libevent \
    gearmand \
    libgearman \
    libgearman-devel \
    php \
    php-bcmath \
    php-common \
    php-pear \
    php-mysql \
    php-cli \
    php-devel \
    php-gd \
    php-fpm \
    php-pdo \
    php-mbstring \
    php-mcrypt \
    php-soap \
    php-xml \
    php-xmlrpc \
    php-pecl-gearman && yum clean all

# Configure servicies
ADD ./start.sh /start.sh
ADD ./supervisor-phpworker.ini /etc/supervisord.d/phpworker.ini

RUN chmod 755 /start.sh

RUN mkdir -p /var/www/scripts
ADD ./worker.php /var/www/scripts/worker.php

RUN mkdir -p /var/log/phpworker

VOLUME ["/var/www/scripts", "/var/log/phpworker"]

CMD ["/bin/bash", "/start.sh"]

