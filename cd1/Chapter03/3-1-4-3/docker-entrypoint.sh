#!/bin/bash

set -eu

# Bundler 의존관계 확인
bundle check || true

# Yarn 의존관계 확인
yarn check --integrity --silent || true

exec "$@"
