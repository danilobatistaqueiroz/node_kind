FROM node:14-alpine

WORKDIR /usr/src/app

COPY ./app /usr/src/app

EXPOSE 3300

CMD node --inspect=0.0.0.0 server.js