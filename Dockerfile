#FROM debian:stable-slim
FROM ubuntu:xenial
LABEL maintainer="mattias.rundqvist@icloud.com"

#WORKDIR /app

#RUN apt update && apt full-upgrade -y && apt autoremove -y && apt-get autoclean -y
RUN apt update
#RUN apt install openjdk-11-jre-headless jsvc libcommons-daemon-java -y
RUN apt-get install ca-certificates apt-transport-https -y

RUN apt install wget gnupg -y

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
RUN echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list

RUN wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | apt-key add -
RUN echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

#RUN wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | apt-key add -
#RUN echo "deb https://repo.mongodb.org/apt/debian stretch/mongodb-org/3.6 main" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

RUN apt update
#RUN apt-mark hold openjdk-11-*
#RUN apt update && apt full-upgrade -y && apt autoremove -y && apt-get autoclean -y

#RUN apt install mongodb-server
RUN apt install -y openjdk-8-jre-headless
RUN apt install unifi -y
RUN apt install procps nano -y
RUN apt install supervisor -y

COPY root /
RUN chmod +x /app/entrypoint.sh
#RUN wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg 

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
#RUN echo 'deb https://www.ui.com/downloads/unifi/debian stretch ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list

#RUN apt update

#COPY root /

#RUN chmod +x /usr/sbin/log /usr/sbin/var /usr/sbin/echoip \
#	&& chmod +x /app/healthcheck.sh /app/entrypoint.sh

#HEALTHCHECK --interval=60s --timeout=30s --start-period=15s \  
# CMD /bin/sh /app/healthcheck.sh

# /usr/bin/java -Dlog4j2.formatMsgNoLookups=true -jar /usr/lib/unifi/lib/ace.jar start

#ENTRYPOINT [ "sleep", "infinity"  ]
ENTRYPOINT [ "/app/entrypoint.sh" ]