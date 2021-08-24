# syntax=docker/dockerfile:1

FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]

RUN apt update

# Set ENV
ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND noninteractive

# Install deps
RUN apt install -qq -y --no-install-recommends \
    bison build-essential ca-certificates \
    clang curl fcitx-mozc \
    fonts-noto-cjk g++-multilib gcc-multilib \
    git gperf im-config \
    language-pack-ja language-pack-ja-base libasound2-dev \
    libcap-dev libcups2-dev libdbus-1-dev \
    libgtk-3-dev libnotify-dev \
    libnss3-dev libxshmfence-dev libxss1 \
    libxtst-dev openjdk-8-jre tzdata x11-apps \
    && im-config -n fcitx

# Install nvm and Nodejs
ENV NODE_VERSION v14.17.4
RUN curl -sfSO --retry 5 https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz \
    && tar xf node-${NODE_VERSION}-linux-x64.tar.gz -C /usr/local \
    && rm node-${NODE_VERSION}-linux-x64.tar.gz
ENV PATH $PATH:/usr/local/node-${NODE_VERSION}-linux-x64/bin

# Install npm
# RUN apt install -qq -y --no-install-recommends npm
RUN node --version && npm --version

# Set fcitx
ENV GTK_IM_MODULE=xim
ENV QT_IM_MODULE=fcitx
ENV XMODIFIERS=@im=fcitx
ENV DefalutIMModule=fcitx

# Set locale C->JP
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8

# Clone Repo
RUN export GIT_SSL_NO_VERIFY=1 \
    && git clone --depth 1 https://github.com/Hiroshiba/voicevox

RUN cd voicevox \
    && sed 's_127.0.0.1:50021_0.0.0.0:80_g' .env.production > .env \
    && npm config set unsafe-perm true \
    && npm ci

WORKDIR /voicevox
CMD npm run electron:serve
