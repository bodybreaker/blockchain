#!/bin/bash

set -eu

# Bundler 의존관계 확인
bundle check || true

exec "$@"
