FROM debian:jessie-slim

RUN apt-get update
RUN apt-get -y install wget

RUN useradd pocketmine
WORKDIR /home/pocketmine

ADD server.properties ./server.properties.example
ADD pocketmine.yml ./pocketmine.yml.example

RUN wget -q -O - http://get.pocketmine.net/ > setup.sh
RUN chmod +x setup.sh
RUN chown -R pocketmine:pocketmine /home/pocketmine

USER pocketmine

RUN ./setup.sh
RUN rm setup.sh

USER root
RUN apt-get -y remove wget
RUN apt-get -y autoremove

ADD entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN chown -R pocketmine:pocketmine /home/pocketmine

USER pocketmine

EXPOSE 19132/udp 19132/tcp

CMD ["/home/pocketmine/entrypoint.sh"]
