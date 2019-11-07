FROM alpine:3.10

ENV ALPINE_VERSION=3.10 \
    PACKAGES="\
      dumb-init \
      bash \
      zsh \
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
  apk add --no-cache --virtual .build-deps git ||\
    (sed -i -e 's/dl-cdn/dl-4/g' /etc/apk/repositories && apk add --no-cache --virtual .build-deps git) ;\
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/plugins/zsh-syntax-highlighting ;\
  git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/plugins/zsh-autosuggestions ;\
  echo "http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/main/" > /etc/apk/repositories ;\
  # echo "@community http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/community" >> /etc/apk/repositories ;\
  # echo "@testing http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/testing" >> /etc/apk/repositories ;\
  # echo "@edge-main http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories ;\
  apk del .build-deps ;\
  rm -rf /var/cache/apk/*