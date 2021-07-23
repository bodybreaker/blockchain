# Docker 공식 Ruby 이미지
FROM ruby:3.0.1-buster

# 애플리케이션 배치 디렉터리
WORKDIR /app

# Bundler로 gem 설치
COPY Gemfile Gemfile.lock ./
RUN bundle install