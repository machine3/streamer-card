FROM node:20-alpine

LABEL authors=""

RUN apk update && apk add chromium

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /app

COPY . .

RUN yarn config set registry https://registry.npmmirror.com

RUN yarn install

WORKDIR /app

EXPOSE 3003

CMD [ "node", "src/index.ts" ]
