FROM php:8.3-fpm

RUN apt-get update && \
    apt-get install -y git unzip iputils-ping && \
    docker-php-ext-install pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer global require laravel/installer

ENV PATH="$PATH:$HOME/.composer/vendor/bin"

WORKDIR /var/www
