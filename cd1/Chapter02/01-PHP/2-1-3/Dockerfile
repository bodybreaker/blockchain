FROM php:8.0-fpm

RUN apt-get update && \
    apt-get install -y unzip gpg locales wget zlib1g-dev && \
    docker-php-ext-install pdo_mysql mysqli

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

WORKDIR /app/src
COPY ./example-app .
RUN composer install

CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
