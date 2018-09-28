FROM ubuntu:latest

LABEL maintainer="Arnaud Wallon (arnaud@netbeat.be)"

ENV ANNOTATE_SERVER localhost:9099
ENV USER_REPOSITORY localhost:9095

ENV SHA256 7c6102035febf6905b96587c7e0d84103b8271e357b5be45c849010f5221fef1

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils openjdk-8-jdk-headless wget unzip

RUN mkdir /opt/maven && \
    cd /opt/maven && \
    wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip && \
    unzip apache-maven-3.3.9-bin.zip

RUN mkdir /opt/leos && \
    cd /opt/leos/ && \
    wget https://joinup.ec.europa.eu/sites/default/files/distribution/access_url/2018-08/3cb1e8a1-2dab-4455-a0f6-69f990e9af42/LEOS-Pilot_2.0.0.zip && \
    echo "$SHA256 LEOS-Pilot_2.0.0.zip" | sha256sum -c - && \
    unzip LEOS-Pilot_2.0.0.zip

COPY start-leos.sh ./

RUN chmod +x ./start-leos.sh

EXPOSE 9099

ENTRYPOINT ["./start-leos.sh"]
