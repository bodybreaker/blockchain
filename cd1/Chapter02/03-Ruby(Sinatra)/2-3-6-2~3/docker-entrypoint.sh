#!/bin/bash

set -eu

#필요에 따라 Bundler로 gem 설치
bundle check || bundle install

exec "$@"