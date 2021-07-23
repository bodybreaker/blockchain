#!/bin/sh
set -euo pipefail

if [ -z "${1+x}" ] || [ "${1#-}" != "$1" ]; then
    set -- top -b "$@"
fi

exec "$@"
