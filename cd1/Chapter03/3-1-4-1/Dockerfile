# Docker 공식 Ruby이미지 사용
FROM ruby:3.0.1-buster

# 애플리케이션 배치 디렉터리
WORKDIR /app

# Node.js v14 계열과 Yarn안정판 설치
RUN curl -sSfL https://deb.nodesource.com/setup_14.x | bash - \
    && curl -sSfL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y \
        nodejs \
        yarn \
    && rm -rf /var/lib/apt/lists/*

# Bundler로 gem인스톨
ARG BUNDLE_INSTALL_ARGS="-j 4"
COPY Gemfile Gemfile.lock ./

RUN bundle install ${BUNDLE_INSTALL_ARGS}

# 엔트리 포인트 설정
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# 애플리케이션 파일 복사
COPY . ./

# 서버를 실행하기 위한 커맨드와 포트 설정
CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000
