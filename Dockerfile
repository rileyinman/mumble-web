FROM node:current-alpine

RUN apk add --no-cache g++ make

COPY . /var/www/mumble-web

WORKDIR /var/www/mumble-web

ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm install
