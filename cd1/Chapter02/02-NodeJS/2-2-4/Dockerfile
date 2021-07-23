FROM node:14.16.1

ENV NUXT_HOST=0.0.0.0
WORKDIR /app
COPY ./app/package.json ./app/yarn.lock ./
RUN yarn install

COPY ./app .

CMD ["yarn", "run", "dev"]
