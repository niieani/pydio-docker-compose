FROM ubuntu

WORKDIR /srv

# can be 'develop'
ENV VERSION release/1.0.2

RUN apt-get update && apt-get install -y --no-install-recommends gettext-base
ADD https://download.pydio.com/pub/booster/${VERSION}/linux_amd64/pydio /srv/
ADD *.template /srv/
ADD run.sh /srv/

RUN mv pydio pydio-booster \
 && chmod +x pydio-booster \
 && chown -R 33:33 /srv

USER www-data

EXPOSE 8090 4150
CMD bash run.sh ./pydio-booster -c pydioconf
