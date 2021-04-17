#!/bin/bash
set -euo pipefail
script_root="$(cd "$(dirname "$(readlink "$([[ "${OSTYPE}" == linux* ]] && echo "-f")" "$0")")"; pwd)"

source "${script_root}/lib/prepare-env.sh"

docker run \
    -it \
    --rm \
    -p 8444:8444/tcp \
    -p 58444:58444/tcp \
    -p 127.0.0.1:3000:3000/tcp \
    -v "${script_root}/.docker-home-${TAG}":/root \
    -v "${script_root}/.docker-mnt":/mnt \
    "chia:${TAG}" \
    /bin/sh -c "cd chia-blockchain-gui && npm start $*"

