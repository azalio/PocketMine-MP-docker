FROM debian:jessie-slim

RUN apt-get update
RUN apt-get -y install wget

RUN useradd pocketmine
WORKDIR /home/pocketmine

ADD server.properties .
ADD pocketmine.yml .
ADD entrypoint.sh .

RUN wget -q -O - http://get.pocketmine.net/ > setup.sh

RUN chmod +x setup.sh entrypoint.sh

RUN chown -R pocketmine:pocketmine /home/pocketmine

USER pocketmine

RUN ./setup.sh
RUN rm setup.sh

USER root
RUN apt-get -y remove wget
RUN apt-get -y autoremove
USER pocketmine

EXPOSE 19132/udp

ENTRYPOINT ["./entrypoint.sh"]
