FROM alpine

# install bash & envsubst
RUN apk add --no-cache --update libintl bash \
 && apk add --no-cache --virtual build_deps gettext \
 && cp /usr/bin/envsubst /usr/local/bin/envsubst \
 && apk del build_deps

WORKDIR /srv

ADD https://download.pydio.com/pub/booster/develop/linux_amd64/pydio /srv/pydio-booster
ADD *.template /srv/
ADD run.sh /srv/

RUN chmod +x pydio-booster \
 && chown -R 33:33 /srv

USER 33

EXPOSE 8090 4150
CMD bash run.sh
