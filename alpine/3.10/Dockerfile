FROM alpine:3.10

ENV ALPINE_VERSION=3.10 \
    PACKAGES="\
      dumb-init \
      ca-certificates \
      tzdata \
    " \
    BUILD_PACKAGES="\
      build-base \
      musl-dev \
      gcc \
      linux-headers \
      libc6-compat \
      libffi-dev \
    "\
    TZ=UTC

RUN set -ex; \
  echo "http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/community" >> /etc/apk/repositories ;\
  echo "http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/main" >> /etc/apk/repositories ;\
  apk update ;\
  apk add --no-cache ${PACKAGES} ||\
    (sed -i -e 's/dl-cdn/dl-4/g' /etc/apk/repositories && apk add --no-cache $PACKAGES) ;\
  echo "http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/main/" > /etc/apk/repositories ;\
  # echo "@community http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/community" >> /etc/apk/repositories ;\
  # echo "@testing http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/testing" >> /etc/apk/repositories ;\
  # echo "@edge-main http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories ;\
  rm -rf /var/cache/apk/*