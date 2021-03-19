#!/bin/bash
set -euo pipefail

: "${TAG:?please set to git tag, branch name or commit hash}"

docker build --build-arg TAG="${TAG}" --build-arg WITH_GUI=1 -t "chia:${TAG}" .

