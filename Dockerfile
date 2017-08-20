FROM node:6-alpine
MAINTAINER Jasper Timmer <jjwtimmer@gmail.com>

RUN apk --update add \
        python \
        make \
        g++ \
 &&     rm -rf /var/cache/apk/* \
 && 	npm install -g screeps

COPY docker-entrypoint.sh /usr/local/bin/

VOLUME /screeps

WORKDIR /screeps

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["screeps", "start"]
