# syntax=docker/dockerfile:1

FROM ubuntu:20.04
RUN apt update

# Set ENV
ENV TZ Asia/Tokyo

# Install deps
RUN apt install -qq -y \
    curl \
    git \
    x11-apps \
    tzdata

# Clone Repo
RUN git clone --depth 1 https://github.com/Hiroshiba/voicevox \
    && cd voicevox

# Install Nodejs and npm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash \
    && nvm install "`cat ./.node-version`" \
    && apt install -qq -y npm

# Setup X11
ARG DISPLAY=:0
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${uid} tester \
    && useradd -u ${gid} -g tester -r tester \
    && mkdir /home/tester \
    && chown ${uid}:${gid} -R /home/tester

# Set env
RUN sed 's_127.0.0.1:50021_0.0.0.0:80_g' .env.production > .env

USER tester
WORKDIR /home/tester

# Run setup ci
RUN npm ci

# Exec
CMD npm run electron:serve
