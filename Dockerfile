FROM alpine

RUN apk add -U git

RUN git clone https://github.com/PocketMine/PocketMine-MP.git

RUN apk add -U bash php7

ENV PHP_BINARY /usr/bin/php7