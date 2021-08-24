#!/bin/bash
text="ABCDEFG"

port="${1-80}"

curl -s \
    -X POST \
    "localhost:${port}/audio_query?text=$text&speaker=1" \
    >query.json

curl -s \
    -H "Content-Type: application/json" \
    -X POST \
    -d @query.json \
    "localhost:${port}/synthesis?speaker=1" \
    >audio.wav
