# Infrastructure

🐳 FSP Network Gen2 Server Infrastructure, all Docker image based this.

[![MicroBadger Size](https://img.shields.io/microbadger/image-size/fspnetwork/infrastructure.svg?style=flat-square)](https://microbadger.com/#/images/fspnetwork/infrastructure)
[![Docker Automated build](https://img.shields.io/docker/automated/fspnetwork/infrastructure.svg?style=flat-square)](https://hub.docker.com/r/fspnetwork/infrastructure/)
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg?style=flat-square)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![996.icu](https://img.shields.io/badge/link-996.icu-red.svg?style=flat-square)](https://996.icu)


## Supported tags

- [`latest`, `alpine`, `alpine-3.10` (Dockerfile)](https://github.com/FSPNET/c/blob/master/alpine/3.10/Dockerfile)
- [`alpine-3.9` (Dockerfile)](https://github.com/FSPNET/c/blob/master/alpine/3.9/Dockerfile)
- [`development`, `alpine-development` (development)](https://github.com/FSPNET/c/blob/master/alpine/development/Dockerfile)

**Notes:**
- `development` tag will always use the latest version based upstream.

## Details

- Installs `oh-my-zsh` allowing interaction with the development.
- Added `testing` and `community` repositories to Alpine's `/etc/apk/repositories` file

## Usage

Use like you would any other base image:

```dockerfile
FROM fspnetwork/infrastructure
RUN apk add --no-cache mysql-client
ENTRYPOINT ["mysql"]
```

## LICENSE

The code in this repository, unless otherwise noted, is [Anti-996](LICENSE) licensed. See the LICENSE file in this repository.

## More

- Some code based on [jfloff/alpine-python](https://github.com/jfloff/alpine-python)
