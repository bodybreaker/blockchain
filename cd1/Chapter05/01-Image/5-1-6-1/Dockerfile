FROM ruby:2.6.1-alpine3.9 AS gemfiles

# 빌드에 필요한 패키지 설치
RUN apk add --no-cache \
        build-base \
        mariadb-connector-c-dev

WORKDIR /app

# Gem설치
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf "${GEM_HOME}/cache"


FROM ruby:2.6.1-alpine3.9 AS fonts

WORKDIR /tmp


FROM ruby:2.6.1-alpine3.9

# 패키지 설치
RUN apk add --no-cache \
        mariadb-connector-c
RUN apk add --no-cache \
        wkhtmltopdf

# Gem 파일 가져오기
COPY --from=gemfiles /usr/local/bundle/ /usr/local/bundle/

WORKDIR /app

# 애플리케이션 복사
COPY . ./
CMD ["ruby", "app.rb"]
