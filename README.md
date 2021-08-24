# voicevox_docker

[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/eggplanter/voicevox)](https://hub.docker.com/repository/docker/eggplanter/voicevox)

- [VOICEVOX](https://voicevox.hiroshiba.jp/) on Docker

## Run

```bash
$ docker build -t voicevox .
$ docker run -d -p 80:80 voicevox
$ curl localhost:80/version
"0.4.1"
$ xdg-open http://localhost:80/docs # open API docs
$ ./test.sh # it will read out "ABCDEF"
```

## Reference

- [テキスト読み上げソフトウェアの VOICEVOX を Linux で使ってみて思ったこと](https://zenn.dev/tantan_tanuki/articles/78428a29aab2d2)
