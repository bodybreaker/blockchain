# Docker 공식 Ruby이미지 사용
FROM ruby:3.0.1-buster

# 애플리케이션 배치 디렉터리
WORKDIR /app

# 설치하는 Node.js와 Yarn 버전
# NODE_SHA256SUM 값은 https://nodejs.org/dist/${NODE_VERSION}/SHASUMS256.txt 참조
ENV \
    NODE_VERSION=v14.16.1 \
    NODE_DISTRO=linux-x64 \
    NODE_SHA256SUM=85a89d2f68855282c87851c882d4c4bbea4cd7f888f603722f0240a6e53d89df \
    YARN_VERSION=1.22.5

# Yarn 설치로 Node.js 버전을 확인하기 때문에 설치되는 곳의 PATH 설정
ENV PATH=/opt/node-${NODE_VERSION}-${NODE_DISTRO}/bin:/opt/yarn-${YARN_VERSION}/bin:${PATH}

# Node.js와 Yarn 설치
RUN curl -sSfLO https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz \
    && echo "${NODE_SHA256SUM} node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz" | sha256sum -c - \
    && tar -xJ -f node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz -C /opt \
    && rm -v node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz \
    && curl -o - -sSfL https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION} 

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
