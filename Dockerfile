# syntax=docker/dockerfile:1

FROM ubuntu:20.04
RUN apt update

# Set ENV
ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND noninteractive

# Install deps
RUN apt install -qq -y \
    apt-utils \
    curl \
    gnupg \
    software-properties-common \
    tzdata \
    unar

# Setup wine
RUN dpkg --add-architecture i386
# RUN curl -fsSL https://dl.winehq.org/wine-builds/winehq.key | \
#     APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add -
# RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
# RUN apt install winehq-stable -qq -y --install-recommends
RUN apt install -qq -y wine

# Download VOICEVOX Archived file
ENV VOICEVOX_DRIVE_ID 1l-VsodiRw4cgWW6XZCgWpRigiPFRrqNQ
RUN curl -s gdrive.sh | bash -s "$VOICEVOX_DRIVE_ID"

# Extract Zip
RUN unar VOICEVOX\ *.zip && rm VOICEVOX\ *.zip && mv VOICEVOX\ * VOICEVOX_

# Launch API server in localhost:80
ENV VOICEVOX_DIR=./VOICEVOX_/VOICEVOX
CMD cd "$VOICEVOX_DIR" && wine run.exe --host 0.0.0.0 --port 80
