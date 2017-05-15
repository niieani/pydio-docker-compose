FROM python:latest

RUN apt-get update && apt-get install -y curl sed grep mktemp git \
&& cd / \
&& git clone https://github.com/lukas2511/dehydrated \
&& cd dehydrated \
&& mkdir hooks \
&& git clone https://github.com/kappataumu/letsencrypt-cloudflare-hook hooks/cloudflare \
&& pip install -r hooks/cloudflare/requirements.txt \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

WORKDIR /dehydrated
VOLUME /dehydrated/certs
VOLUME /dehydrated/accounts

USER 33

ENTRYPOINT ./dehydrated --cron --challenge dns-01 --accept-terms --ipv4 --hook 'hooks/cloudflare/hook.py'