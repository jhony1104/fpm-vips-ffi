FROM php:7.4-fpm

RUN apt-get update && apt-get -y --no-install-recommends install libvips libffi-dev wget unzip

RUN docker-php-ext-install ffi

RUN wget 'https://getcomposer.org/download/2.3.4/composer.phar' -O /usr/local/bin/composer && chmod +x /usr/local/bin/composer

COPY composer.json composer.lock ./

RUN composer install

RUN echo "ffi.enable = true" >> "/usr/local/etc/php/conf.d/ffi.ini"

RUN sed -i -e 's/pm.max_children.*/pm.max_children = 1/' -e 's/pm.start_servers.*/pm.start_servers = 1/' -e 's/pm.min_spare_servers.*/pm.min_spare_servers = 1/' -e 's/pm.max_spare_servers.*/pm.max_spare_servers = 1/' /usr/local/etc/php-fpm.d/www.conf