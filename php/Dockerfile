FROM php:fpm:7.0

RUN apt-get update && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
        fontconfig-config fonts-dejavu-core wget locales \
    && pecl channel-update pecl.php.net \
    && docker-php-ext-install -j$(nproc) iconv mcrypt exif opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd intl mysqli pdo_mysql

RUN mkdir /php && chown www-data:www-data /php && chmod 770 /php

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG=en_US.UTF-8' > /etc/default/locale && \
    echo 'LANGUAGE=en_US:en' >> /etc/default/locale && \
    echo 'LC_ALL=en_US.UTF-8' >> /etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

CMD php-fpm