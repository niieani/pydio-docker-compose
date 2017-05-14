#!/bin/bash

APIKEY=$(< /srv/www/data/plugins/core.mq/apikey)
export TOKENP=${APIKEY##*:}
export TOKENS=${APIKEY%%:*}

envsubst < pydiocaddy.template > pydiocaddy
envsubst < pydioconf.template > Caddyfile

exec "$@"
