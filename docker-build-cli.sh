#!/bin/sh
set -euo pipefail

: "${TAG:?please set to git tag, branch name or commit hash}"

docker build --build-arg TAG="${TAG}" -t "chia:${TAG}" .

