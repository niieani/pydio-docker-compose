FROM php:fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        php-pear fontconfig-config fonts-dejavu-core unzip wget \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN mkdir /php && chown www-data:www-data /php && chmod 660 /php

# echo listen = [::]:9000 \
RUN { \
      echo [global] ;\
      echo daemonize = no ;\
      echo ;\
      echo [www] ;\
      echo listen = /php/php.sock ;\
      echo listen.owner = www-data ;\
      echo listen.group = www-data ;\
      echo listen.mode = 0660 ;\
      echo slowlog = /proc/self/fd/2 ;\
      echo request_slowlog_timeout = 10s ;\
      echo security.limit_extensions = .php ;\
      echo rlimit_files = 10240 ;\
      echo php_admin_flag[output_buffering] = off ;\
      echo php_admin_flag[cgi.fix_pathinfo] = off ;\
      echo php_admin_value[upload_max_filesize] = 2G ;\
      echo php_admin_value[post_max_size] = 2G ;\
    } | tee /usr/local/etc/php-fpm.d/zz-docker.conf

###########################
# Pydio
ARG PYDIO_VERSION=6.2.2
WORKDIR /srv
RUN wget http://downloads.sourceforge.net/project/ajaxplorer/pydio/stable-channel/${PYDIO_VERSION}/pydio-core-${PYDIO_VERSION}.zip && \
    unzip pydio-core-${PYDIO_VERSION}.zip && \
    mv pydio-core-${PYDIO_VERSION} www && \
    chown -R www-data:www-data /srv/www && \
    mv /srv/www/data /pydio-data && \
    ln -s /pydio-data /srv/www/data

VOLUME /pydio-data

# RUN chmod -R 660 /srv/www
# RUN chmod 777 /srv/www/pydio-core/data/files/
# RUN chmod 777 /srv/www/pydio-core/data/personal/

CMD php-fpm

# "s/$(echo "$1" | sed -e 's/\([[\/.*]\|\]\)/\\&/g')/$(echo "$2" | sed -e 's/[\/&]/\\&/g')/g" "$3"