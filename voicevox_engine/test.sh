#!/usr/bin/env bash

command -v aplay curl docker nkf>/dev/null || {
  echo "[!]: Install aplay, curl, docker, nkf" >&2
  exit 1
}

if [ "$(curl localhost:80/version -o /dev/null -w '%{http_code}' -s)" -ne 200 ]; then

  echo "[+]: Launching container..."
  docker run -d -p 80:80 eggplanter/voicevox_engine

  echo "[+]: Waiting for launching API server of VOICEVOX engine..."
  while :; do
    s="$(curl localhost:80/version -o /dev/null -w '%{http_code}' -s)"
    if [ "$s" -eq 200 ]; then
      break
    else
      sleep 1
    fi
  done
fi

text="${1-今日のご飯はカツ丼だよ。}"
echo "[+]: TEXT: <<<$text>>>"

echo "[+]: Create vocal annotation from text..."
curl -X POST \
     "localhost:80/audio_query?text=$(
     <<<"$text" \
     nkf -WwMQ | sed 's/=$//g' | tr = % | tr -d '\n'
     )&speaker=1" >/tmp/_

echo "[+]: Synthesizing..."
curl -H "Content-Type: application/json" \
     -X POST -d @/tmp/_ \
    "localhost:80/synthesis?speaker=1">/tmp/_.wav

echo "[+]: Playing..."
aplay /tmp/_.wav
