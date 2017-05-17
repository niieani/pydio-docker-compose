#!/usr/bin/env bash
# get Pydio source
PYDIO_VERSION=8.0.0

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

function replace {
  LC_ALL=C sed -i "s/$(echo $1 | sed -e 's/\([[\/.*]\|\]\)/\\&/g')/$(echo $2 | sed -e 's/[\/&]/\\&/g')/g" $3
}

# fix a bug in 7.0.4 uploader code:
# replace "this.configs.get" "configs.get" "data/pydio/plugins/uploader.html/js/build/UploaderModel.js"

