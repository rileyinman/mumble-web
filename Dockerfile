FROM node:current-alpine AS build

RUN apk add --no-cache g++ make

COPY . /var/www/mumble-web

WORKDIR /var/www/mumble-web

ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm install

FROM node:current-alpine AS serve

RUN apk add --no-cache lighttpd

COPY --from=build /var/www/mumble-web/dist /var/www/localhost/htdocs

ENTRYPOINT ["/usr/sbin/lighttpd", "-D"]
