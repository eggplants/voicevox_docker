#!/usr/bin/env bash

# set -e

command -v aplay curl docker nkf>/dev/null || {
  echo "[!]: Install aplay, curl, docker, nkf" >&2
  exit 1
}

[ "$(curl localhost:80/version -o /dev/null -w '%{http_code}' -s)" = "200" ] || {

  echo "[+]: Launching container..."
  docker run -d -p 80:80 eggplanter/voicevox_engine

  echo "[+]: Waiting for launching API server of VOICEVOX engine..."
  while :; do
    docker ps | grep "eggplanter/voicevox_engine" -q || {
      echo "[!]: Maybe container is down after launching.">&2
      echo "[!]: See: https://stackoverflow.com/a/66137732">&2
      exit 1
    }
    s="$(curl localhost:80/version -o /dev/null -w '%{http_code}' -s)"
    if [ "$s" -eq 200 ]; then
      break
    else
      sleep 1
    fi
  done
}

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
    "localhost:80/synthesis?speaker=1">/tmp/_.wav || {
      echo "[!]: Voice is empty. Maybe container is down after launching.">&2
      echo "[!]: See: https://stackoverflow.com/a/66137732">&2
      ids="$(
         docker ps | grep Exited |
         grep 'eggplanter/voicevox_engine' | awk '$0=$1'
      )"
      if [ -n "$ids" ]; then
        echo "$ids" | xargs docker rm
      fi
      exit 1
    }

echo "[+]: Playing..."
aplay /tmp/_.wav
