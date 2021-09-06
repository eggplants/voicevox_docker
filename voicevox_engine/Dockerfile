# syntax=docker/dockerfile:1
FROM ubuntu:20.04

# Set ENV
ENV TZ Asia/Tokyo
ENV DEBIAN_FRONTEND noninteractive

# Setup wine
RUN dpkg --add-architecture i386

# Install deps
RUN apt-get update -y -qq \
    && apt-get install -qq -y \
    apt-utils \
    curl \
    gnupg \
    software-properties-common \
    tzdata \
    unar \
    wine

# Download VOICEVOX Archived file
ENV VOICEVOX_DRIVE_ID 1l-VsodiRw4cgWW6XZCgWpRigiPFRrqNQ
RUN curl -s gdrive.sh | bash -s "$VOICEVOX_DRIVE_ID" \
    && [ -f *.zip ] || { \
    echo "Error: VOICEVOX archive file is currently restricted by gdrive." >&2 \
    && exit 1;}

# Extract Zip
RUN unar VOICEVOX\ *.zip && rm VOICEVOX\ *.zip && mv VOICEVOX\ * VOICEVOX_

# Launch API server in localhost:80
ENV VOICEVOX_DIR=./VOICEVOX_/VOICEVOX
CMD cd "$VOICEVOX_DIR" && wine run.exe --host 0.0.0.0 --port 80
