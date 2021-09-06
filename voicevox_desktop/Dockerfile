FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]

# Set ENV
ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND noninteractive

# Install deps
RUN apt-get update -qq -y \
    && apt-get install -qq -y --no-install-recommends \
    bison build-essential ca-certificates clang curl \
    g++-multilib gcc-multilib git gperf libasound2-dev \
    libcap-dev libcups2-dev libdbus-1-dev libgtk-3-dev \
    libnotify-dev libnss3-dev libxss1 libxtst-dev \
    openjdk-8-jre tzdata x11-apps

RUN apt-get install -qq -y \
    language-pack-ja-base language-pack-ja fonts-noto-cjk fcitx-mozc \
    && im-config -n fcitx

ENV GTK_IM_MODULE=xim \
    QT_IM_MODULE=fcitx \
    XMODIFIERS=@im=fcitx \
    DefalutIMModule=fcitx

RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8 \
    LC_ALL=ja_JP.UTF-8

# Install nvm and Nodejs
ENV NODE_VERSION v14.17.4
RUN curl -sfSO --retry 5 https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.gz \
    && tar xf node-${NODE_VERSION}-linux-x64.tar.gz -C /usr/local \
    && rm node-${NODE_VERSION}-linux-x64.tar.gz
ENV PATH $PATH:/usr/local/node-${NODE_VERSION}-linux-x64/bin

# Install npm
# RUN apt install -qq -y --no-install-recommends npm
RUN node --version && npm --version

# add user
# ARG DOCKER_UID=1000
# ARG DOCKER_USER=docker
# ARG DOCKER_PASSWORD=docker
# RUN useradd -m \
#   --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
#   && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

# Clone Repo
RUN export GIT_SSL_NO_VERIFY=1 \
    && git clone --depth 1 https://github.com/Hiroshiba/voicevox

RUN cd voicevox \
    && mkdir dist_electron \
    && sed 's_127.0.0.1:50021_0.0.0.0:80_g' .env.production > .env \
    && npm config set unsafe-perm true \
    && npm ci

# USER ${DOCKER_USER}
WORKDIR /voicevox
CMD npm run electron:serve
