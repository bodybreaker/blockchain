FROM ruby:2.6.1-alpine3.9

# 패키지 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libfontconfig1 \
        libfreetype6 \
        libmariadbclient18 \
        libssl1.0-dev \
        libx11-6 \
        libxext6 \
        libxrender1 \
        && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Gem 파일 가져오기
COPY Gemfile Gemfile.lock ./
# 빌드할 때만 필요한 패키지에 buildonly-deps라는 이름을 붙여서, bundle install 후에 삭제
RUN apk add --no-cache --virtual buildonly-deps \
        build-base \
        mariadb-connector-c-dev \
        && \
    bundle install && \
    apk del buildonly-deps

# 애플리케이션 복사
COPY . ./
CMD ["ruby", "app.rb"]
