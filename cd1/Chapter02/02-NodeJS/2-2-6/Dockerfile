FROM node:14.16.1

ENV NUXT_HOST=0.0.0.0
ENV TINI_VERSION=v0.18.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

WORKDIR /app
COPY ./app/package.json ./app/yarn.lock ./
RUN yarn install

COPY ./app .

CMD ["/tini", "--", "yarn", "run", "dev"]
