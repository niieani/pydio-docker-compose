#!/usr/bin/env bash
# get Pydio source
PYDIO_VERSION=7.0.4

wget https://download.pydio.com/pub/core/archives/pydio-core-${PYDIO_VERSION}.tar.gz && \
tar -zxf pydio-core-${PYDIO_VERSION}.tar.gz

mkdir -p data
mv pydio-core-${PYDIO_VERSION} data/pydio && \
chown -R www-data:www-data data/pydio
rm pydio-core-${PYDIO_VERSION}.tar.gz

# mysqld
mkdir -p data/run/mysqld
chmod 777 data/run/mysqld

# remember to get initial certs before first run
