FROM node:19-alpine

WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build
CMD yarn start:prod

