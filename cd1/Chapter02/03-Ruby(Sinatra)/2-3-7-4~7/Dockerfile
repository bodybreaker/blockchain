# Docker 공식 Ruby 이미지
FROM ruby:3.0.1-buster

# 애플리케이션 배치 디렉터리
WORKDIR /app

# Bundler로 gem 설치
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# 애플리케이션 파일 복사
COPY . ./

# 서버를 실행하기 위한 커맨드와 포트 설정
CMD ["ruby", "app.rb", "-o", "0.0.0.0"]
EXPOSE 4567