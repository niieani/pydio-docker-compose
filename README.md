# pydio-docker-compose

Properly dockerized Pydio on the latest stack: Nginx + HTTP2, PHP 7, MariaDB, LetsEncrypt SSL + CloudFlare API + Pydio Booster

## Usage

1. Clone and run `./get-pydio.sh`
2. Setup you `.env` file, based on `example.env` and setup `letsencrypt/domains.txt`
3. Setup initial certificate: `docker-compose up letsencrypt`.
4. Start and Install pydio `docker-compose up -d nginx php mysql`.
5. When installing, use mysqli driver, not mysql (it's an option during installation)
6. Go to Settings => Application Core => Message Queuing and Generate API Key
7. Start Pydio Booster `docker-compose up -d booster`
8. Run LetsEncrypt continuous cron task: `docker-compose up -d letsencrypt`

All your persisted files -- logs, pydio, etc. will be in `./data`.

## TODO

- [ ] Generate Diffie-Hellman Params to get Grade-A SSL (currently Grade-B), reference: https://gist.github.com/plentz/6737338
