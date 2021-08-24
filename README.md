# voicevox_docker

- [VOICEVOX](https://voicevox.hiroshiba.jp/) on Docker

## Run

```bash
$ docker build -t voicevox .
$ docker run -d -p 80:80 voicevox
$ curl localhost:80/version
"0.4.1"
$ ./test.sh # it will read out "ABCDEF"
```

## Reference

- [テキスト読み上げソフトウェアのVOICEVOXをLinuxで使ってみて思ったこと](https://zenn.dev/tantan_tanuki/articles/78428a29aab2d2)
