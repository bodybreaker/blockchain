# Docker 공식 Ruby이미지 사용
FROM ruby:3.0.1-buster

# 애플리케이션 배치 디렉터리
WORKDIR /app

# node 이미지에서 Node.js와 Yarn 복사
COPY --from=node:14.16.1-buster /usr/local/ /usr/local/
COPY --from=node:14.16.1-buster /opt/ /opt/

# Bundler로 gem인스톨
ARG BUNDLE_INSTALL_ARGS="-j 4"
COPY Gemfile Gemfile.lock ./
RUN bundle install ${BUNDLE_INSTALL_ARGS}

# Yarn으로 Node 패키지 설치
COPY package.json yarn.lock ./
RUN yarn install

# 엔트리 포인트 설정
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# 애플리케이션 파일 복사
COPY . ./

# 서버를 실행하기 위한 커맨드와 포트 설정
CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000
