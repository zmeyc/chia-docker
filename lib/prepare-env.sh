#!/bin/bash
set -euo pipefail
script_root="$(cd "$(dirname "$(readlink "$([[ "${OSTYPE}" == linux* ]] && echo "-f")" "$0")")"; pwd)"

DEFAULT_ENV=.env

[ ! -z "${ENV:-}" ] && [[ ! -f "${ENV}" ]] && printf "%s: file does not exist\n" "${ENV}" && exit 1
ENV="${ENV:-"${DEFAULT_ENV}"}"
[[ -f "${ENV}" ]] && eval "$(grep -v '^#' "${ENV}" | sed -E 's|^(.+)=(.*)$|export \1=${\1:-\2}|g' | xargs -L 1)"

: "${TAG:?please set to git tag, branch name or commit hash}"
ORG="${ORG:-chia-network}"
WITH_BUILD_TOOLS="${WITH_BUILD_TOOLS:-0}"
WITH_GUI="${WITH_GUI:-0}"
WITH_ELECTRON="${WITH_ELECTRON:-0}"

