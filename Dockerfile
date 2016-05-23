FROM alpine:latest

MAINTAINER Andy@AndySpohn.com

ARG VERSION=3.0.0

LABEL version=$version

RUN apk add --no-cache bash nodejs && \
    npm install -g gitbook-cli &&\
	gitbook fetch ${VERSION} &&\
	npm cache clear &&\
	rm -rf /tmp/* &&\
	mkdir -p /srv

WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

EXPOSE 4000 35729

CMD gitbook serve
