FROM node:14.7-alpine

EXPOSE 8000

RUN apk update && apk add git && rm -rf /var/cache/apk/*
RUN npm install --global gatsby --no-optional gatsby@latest
RUN mkdir -p /site
WORKDIR /site
VOLUME /site

COPY ./entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
