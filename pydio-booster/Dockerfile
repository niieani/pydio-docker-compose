FROM ubuntu

WORKDIR /srv

RUN apt-get install -y --no-install-recommends gettext-base

ADD https://download.pydio.com/pub/booster/develop/linux_amd64/pydio /srv/
ADD *.template /srv/
ADD run.sh /srv/

RUN mv pydio pydio-booster \
 && chmod +x pydio-booster \
 && chown -R 33:33 /srv

USER www-data

EXPOSE 8090 4150
CMD bash run.sh
