FROM node:14.16.1

ENV NUXT_HOST=0.0.0.0
WORKDIR /app
COPY ./app .
RUN yarn install

CMD ["yarn", "run", "dev"]
