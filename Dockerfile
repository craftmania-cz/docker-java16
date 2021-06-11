FROM adoptopenjdk/openjdk16:jre-16.0.1_9-alpine

MAINTAINER CraftMania.cz, <services@craftmania.cz>

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig iptables ipset nano \
    && adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]