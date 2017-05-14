FROM ubuntu

WORKDIR /srv

RUN apt-get update && apt-get install -y --no-install-recommends gettext-base

# can be 'develop'
ENV VERSION release/1.0.2
ADD https://download.pydio.com/pub/booster/${VERSION}/linux_amd64/pydio /srv/
ADD *.template /srv/
ADD run.sh /srv/

RUN mv pydio pydio-booster \
 && chmod +x pydio-booster \
 && chown -R 33:33 /srv

USER www-data

EXPOSE 8090 4150
CMD bash run.sh ./pydio-booster -conf pydioconf
