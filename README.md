# voicevox_docker

- [VOICEVOX](https://voicevox.hiroshiba.jp/) on Docker
  - Engine src: [Hiroshiba/voicevox_engine](https://github.com/Hiroshiba/voicevox_engine)
  - Desktop app src: [Hiroshiba/voicevox](https://github.com/Hiroshiba/voicevox)

## Image

| Engine                                                                                | Desktop app                                                                             |
| ------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| [![engine size]](https://hub.docker.com/repository/docker/eggplanter/voicevox_engine) | [![desktop size]](https://hub.docker.com/repository/docker/eggplanter/voicevox_desktop) |

## Run

- First,

```bash
$ git clone https://github.com/eggplants/voicevox_docker
```

## Engine

- stable

```bash
# build & run
## from source
$ cd voicevox_docker/docker_engine && docker-compose up -d
## ...or, from dockerhub
$ docker run -d -p 80:80 eggplanter/voicevox_engine
$ docker ps|awk '/voicevox_engine/{print $1,$2}'
4fcd18217de9 eggplanter/voicevox_engine

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

- unstable (may be not compatible depends on running environments)

```bash
$ xhost local:
non-network local connections being added to access control list

# build & run
## from source
$ cd voicevox_docker/docker_desktop && docker-compose up -d
## ...or, from dockerhub
$ docker run -w /voicevox \
         -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
         -e DISPLAY=$DISPLAY -it --rm --network=host \
         eggplanter/voicevox_desktop
```

## Engine + Desktop app

```bash
$ cd voicevox_docker
$ docker-compose up -d
```

## Reference

- [テキスト読み上げソフトウェアの VOICEVOX を Linux で使ってみて思ったこと](https://zenn.dev/tantan_tanuki/articles/78428a29aab2d2)

[engine size]: https://img.shields.io/docker/image-size/eggplanter/voicevox_engine
[desktop size]: https://img.shields.io/docker/image-size/eggplanter/voicevox_desktop
