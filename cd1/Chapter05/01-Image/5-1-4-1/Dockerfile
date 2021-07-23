FROM ruby:2.6.1-stretch AS gemfiles

WORKDIR /app

# Gem 설치
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf \
        $(gem contents wkhtmltopdf-binary | grep -E '_darwin_x86$|_linux_x86$') \
        "${GEM_HOME}/cache"


FROM ruby:2.6.1-slim-stretch

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

# Gem 파일 가져오기
COPY --from=gemfiles /usr/local/bundle/ /usr/local/bundle/

WORKDIR /app

# 애플리케이션 복사
COPY . ./
CMD ["ruby", "app.rb"]
