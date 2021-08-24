# voicevox_docker

- [VOICEVOX](https://voicevox.hiroshiba.jp/) on Docker
  - Engine src: [Hiroshiba/voicevox_engine](https://github.com/Hiroshiba/voicevox_engine)
  - Desktop app src: [Hiroshiba/voicevox](https://github.com/Hiroshiba/voicevox)

## Image

| Engine                                                                                | desktop                                                                                 |
| ------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| [![engine size]](https://hub.docker.com/repository/docker/eggplanter/voicevox_engine) | [![desktop size]](https://hub.docker.com/repository/docker/eggplanter/voicevox_desktop) |

## Run

## Engine

```bash
# build
## from source
$ docker build -t voicevox_engine voicevox_engine/
## ...or, from dockerhub
$ docker run -d -p 80:80 eggplanter/voicevox_engine

# check
## show version
$ curl localhost:80/version
"0.4.1"
## open docs
$ xdg-open http://localhost:80/docs
## generate voice and play
$ ./test.sh
```

## Desktop app

```bash
# build
## from source
$ docker build -t voicevox_desktop voicevox_desktop/
## ...or, from dockerhub
$ docker run -v /tmp/.X11-unix/:/tmp/.X11-unix eggplanter/voicevox_desktop

# check
[WIP]
```

## Reference

- [テキスト読み上げソフトウェアの VOICEVOX を Linux で使ってみて思ったこと](https://zenn.dev/tantan_tanuki/articles/78428a29aab2d2)

[engine size]: https://img.shields.io/docker/image-size/eggplanter/voicevox_engine
[desktop size]: https://img.shields.io/docker/image-size/eggplanter/voicevox_desktop
