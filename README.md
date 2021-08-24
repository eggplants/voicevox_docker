# voicevox_docker

[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/eggplanter/voicevox_engine)](https://hub.docker.com/repository/docker/eggplanter/voicevox_engine)

- [VOICEVOX](https://voicevox.hiroshiba.jp/) backend API on Docker

## Run

```bash
$ docker build -t voicevox_engine .
$ docker run -d -p 80:80 voicevox_engine
$ curl localhost:80/version
"0.4.1"
$ xdg-open http://localhost:80/docs # open API docs
$ ./test.sh # it will read out "ABCDEF"
```

## Reference

- [テキスト読み上げソフトウェアの VOICEVOX を Linux で使ってみて思ったこと](https://zenn.dev/tantan_tanuki/articles/78428a29aab2d2)
