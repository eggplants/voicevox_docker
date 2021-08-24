# syntax=docker/dockerfile:1

FROM ubuntu:20.04
RUN apt update

# Set ENV
ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND noninteractive

# Install deps
RUN apt install -qq -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    x11-apps \
    tzdata \
    im-config \
    libxshmfence-dev \
    language-pack-ja-base language-pack-ja fonts-noto-cjk fcitx-mozc \
    && im-config -n fcitx

# Install nvm and Nodejs
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 14.17.4

RUN mkdir -p "$NVM_DIR" && curl -s -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm use --delete-prefix $NODE_VERSION"

ENV NODE_PATH "$NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules"
ENV PATH "$NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH"

# Install npm
RUN apt install -qq -y --no-install-recommends npm

# Set fcitx
ENV GTK_IM_MODULE=xim \
    QT_IM_MODULE=fcitx \
    XMODIFIERS=@im=fcitx \
    DefalutIMModule=fcitx

# Set locale C->JP
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8 \
    LC_ALL=ja_JP.UTF-8

# Clone Repo
RUN export GIT_SSL_NO_VERIFY=1 \
    && git clone --depth 1 https://github.com/Hiroshiba/voicevox \
    && cd voicevox \
    && sed 's_127.0.0.1:50021_0.0.0.0:80_g' .env.production > .env \
    && npm ci
