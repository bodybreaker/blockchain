# syntax=docker/dockerfile:1.0-experimental

FROM ruby:2.6.1-alpine3.9 AS base

# apk 파일이 캐시되도록 설정하고 인덱스 받아두기
RUN --mount=type=cache,id=apk,target=/var/cache/apk \
    ln -s /var/cache/apk /etc/apk/cache && \
    apk update


FROM base AS gemfiles

# 빌드에 필요한 패키지 설치
RUN --mount=type=cache,id=apk,target=/var/cache/apk \
    apk add \
        build-base \
        mariadb-connector-c-dev

WORKDIR /app

# Gem 설치
COPY Gemfile Gemfile.lock ./

RUN --mount=type=cache,id=gem,target=/usr/local/bundle/cache \
    --mount=type=cache,id=bundle,target=/root/.bundle/cache \
    bundle install

FROM base

# 패키지 설치
RUN --mount=type=cache,id=apk,target=/var/cache/apk \
    apk add \
        mariadb-connector-c \
        wkhtmltopdf

# Gem 파일 가져오기
COPY --from=gemfiles /usr/local/bundle/ /usr/local/bundle/

WORKDIR /app

# 애플리케이션 복사
COPY . ./
CMD ["ruby", "app.rb"]
