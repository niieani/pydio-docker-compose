FROM alpine

# install bash & envsubst
RUN apk add --no-cache --update libintl bash \
 && apk add --no-cache --virtual build_deps gettext \
 && cp /usr/bin/envsubst /usr/local/bin/envsubst \
 && apk del build_deps

RUN useradd --shell /bin/bash -u 33 -o -c "" -U -m www-data

USER www-data

WORKDIR /srv

ADD https://download.pydio.com/pub/booster/develop/linux_amd64/pydio /srv/pydio-booster
ADD *.template /srv/

RUN chmod +x pydio-booster

EXPOSE 8090 4150
CMD bash run.sh
