FROM php:7.4.2-apache

RUN pecl install xdebug && docker-php-ext-enable xdebug \
    # not yet in linux: xdebug.remote_host = host.docker.internal \n\
    && echo "\n\
    xdebug.remote_host = 172.29.240.1 \n\
    xdebug.default_enable = 1 \n\
    xdebug.remote_autostart = 1 \n\
    xdebug.remote_connect_back = 0 \n\
    xdebug.remote_enable = 1 \n\
    xdebug.remote_handler = "dbgp" \n\
    xdebug.remote_port = 9000 \n\
    xdebug.remote_log = /var/www/html/xdebug.log \n\
    " >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini


# FROM php:7.0-apache

ENV PROJECT_DIR=/var/www/html \
    APP_URL=localhost

RUN docker-php-ext-install mysqli gettext

COPY ./src $PROJECT_DIR
COPY docker-entrypoint.sh /entrypoint.sh

RUN sed -i 's/\r//' /entrypoint.sh

VOLUME $PROJECT_DIR/storage

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["run"]
