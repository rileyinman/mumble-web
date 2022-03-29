FROM node:current-alpine

RUN apk add --no-cache websockify

COPY . /usr/share/mumble-web

WORKDIR /usr/share/mumble-web

RUN npm install && npm run build

ENV MUMBLE_SERVER
CMD [ "websockify", "--web=/app/dist", "--ssl-target", "8080", "$MUMBLE_SERVER" ]
