# voicevox_docker

- [VOICEVOX](https://voicevox.hiroshiba.jp/) on Docker
  - Engine src: [Hiroshiba/voicevox_engine](https://github.com/Hiroshiba/voicevox_engine)
  - Desktop app src: [Hiroshiba/voicevox](https://github.com/Hiroshiba/voicevox)

## Image

| Engine                                                                | Desktop app                                                             |
| --------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| [![engine size]](https://hub.docker.com/r/eggplanter/voicevox_engine) | [![desktop size]](https://hub.docker.com/r/eggplanter/voicevox_desktop) |

## Engine

### Run

```bash
curl -sL https://git.io/JuYaR | docker-compose -f- up -d
# or...
docker run -d -p 80:80 eggplanter/voicevox_engine
```

### Check if engine is running

```bash
# show version
curl localhost:80/version #=> returns "0.4.1" when waking up

# open API docs
xdg-open http://localhost:80/docs

# generate voice and play
curl -sL https://git.io/JuWBZ | bash -s こんにちは
```

## Desktop app

### Run

```bash
xhost local:

curl -sL https://git.io/JuYVJ | docker-compose -f- up
# ...or
docker run -w /voicevox \
           -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
           -e DISPLAY=$DISPLAY -it --network=host \
           eggplanter/voicevox_desktop
```

## Reference

- [テキスト読み上げソフトウェアの VOICEVOX を Linux で使ってみて思ったこと](https://zenn.dev/tantan_tanuki/articles/78428a29aab2d2)

[engine size]: https://img.shields.io/docker/image-size/eggplanter/voicevox_engine
[desktop size]: https://img.shields.io/docker/image-size/eggplanter/voicevox_desktop
