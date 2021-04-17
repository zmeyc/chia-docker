#!/bin/bash
set -euo pipefail
script_root="$(cd "$(dirname "$(readlink "$([[ "${OSTYPE}" == linux* ]] && echo "-f")" "$0")")"; pwd)"

source "${script_root}/lib/prepare-env.sh"

docker build \
  --build-arg ORG="${ORG}" \
  --build-arg TAG="${TAG}" \
  --build-arg WITH_BUILD_TOOLS="${WITH_BUILD_TOOLS}" \
  --build-arg WITH_GUI="${WITH_GUI}" \
  --build-arg WITH_ELECTRON="${WITH_ELECTRON}" \
  -t "chia:${TAG}" \
  .

