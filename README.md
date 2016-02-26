# pydio-docker-compose

Properly dockerized Pydio on the latest stack: Nginx + HTTP2, PHP 7, MariaDB, LetsEncrypt SSL

## Usage

1. Clone
2. Edit instances of `CHANGEME` in the docker-compose.yml file to your liking
3. Run with `docker-compose up -d`.
4. If you get any permission problems, run `chown -R 33:33 ./persistent/data` 

Note: If you don't use LetsEncrypt, set LETSENCRYPT to false in the `docker-compose.yml` file and remember to replace `default.crt` and `default.key` in ./nginx directory!

## TODO

- [ ] Add Diffie-Hellman Params to get Grade-A SSL (currently Grade-B), reference: https://gist.github.com/plentz/6737338