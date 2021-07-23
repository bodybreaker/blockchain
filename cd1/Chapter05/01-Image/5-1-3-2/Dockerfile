FROM ruby:2.6.1-stretch

# 패키지 설치
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libssl1.0-dev \
        && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Gem 설치
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf \
        $(gem contents wkhtmltopdf-binary | grep -E '_darwin_x86$|_linux_x86$') \
        ~/.bundle/cache \
        "${GEM_HOME}/cache"

# 애플리케이션 복사
COPY . ./
CMD ["ruby", "app.rb"]
