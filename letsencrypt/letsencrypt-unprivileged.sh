#!/bin/bash

lastmod() {
  [[ -z "$1" || -z "$1" == *'*'* ]] && return
  echo $(( $(date +%s) - $(date +%s -r "$1") ))
}

while true
do
  # one month
  declare interval=$((30*24*60*60)) 
  declare lastRun=$(lastmod /etc/letsencrypt/live/*/cert.pem | sed -n 1p)

  if [[ -z $lastRun || $(($lastRun > $interval)) -gt 0 ]]; then
    declare IDS="$1"
    shift
    sleep 10
    letsencrypt "$@"
    if [[ $IDS != root ]]; then
      chown -R $IDS /etc/letsencrypt
    fi
  else
    echo "Skipping LetsEncrypt since the certificate should still be valid"
  fi

  sleep $(( 7 * 24 * 60 * 60 ))
done