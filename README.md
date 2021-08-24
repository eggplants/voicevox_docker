# voicevox_docker

- [VOICEVOX](https://voicevox.hiroshiba.jp/) on Docker
  - Engine src: [Hiroshiba/voicevox_engine](https://github.com/Hiroshiba/voicevox_engine)
  - Desktop app src: [Hiroshiba/voicevox](https://github.com/Hiroshiba/voicevox)

## Image

| Engine                                                                                | desktop |
| ------------------------------------------------------------------------------------- | ------- |
| [![engine size]](https://hub.docker.com/repository/docker/eggplanter/voicevox_engine) | [WIP]   |

## Run

## Engine

```bash
# from source
$ docker run -d -p 80:80 eggplanter/voicevox_engine
$ curl localhost:80/version
"0.4.1"
$ xdg-open http://localhost:80/docs # open API docs
$ ./test.sh # it will read out "ABCDEF"
```

## Desktop app

```bash
[WIP]
```

## Reference

- [テキスト読み上げソフトウェアの VOICEVOX を Linux で使ってみて思ったこと](https://zenn.dev/tantan_tanuki/articles/78428a29aab2d2)

[engine size]: https://img.shields.io/docker/image-size/eggplanter/voicevox_engine
