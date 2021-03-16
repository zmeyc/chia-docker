#!/bin/sh
set -euo pipefail

: "${TAG:?please set to git tag, branch name or commit hash}"

docker run \
    -it \
    --rm \
    -p 8444:8444/tcp \
    -p 58444:58444/tcp \
    -p 127.0.0.1:3000:3000/tcp \
    -v "${PWD}/.docker-home":/root \
    "chia:${TAG}" \
    /bin/sh -c "cd chia-blockchain-gui && npm start $*"

