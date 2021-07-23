FROM ruby:2.6.1-stretch

# 패키지 설치
RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
    fonts-nanum \
    libssl1.0-dev
    
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Gem 설치
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 애플리케이션 복사
COPY . ./
CMD ["ruby", "app.rb"]
