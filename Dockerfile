FROM php:7-fpm

RUN docker-php-ext-install mysqli pdo_mysql opcache

# RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN sed -i -e 's/;error_log =/error_log =/' /usr/local/etc/php-fpm.conf

RUN sed -i -e 's/;ping.path/ping.path/' /usr/local/etc/php-fpm.d/www.conf \
 && sed -i -e 's/;pm.status_path = \/status/pm.status_path = \/fpm-status/' /usr/local/etc/php-fpm.d/www.conf