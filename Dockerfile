FROM ubuntu:latest
MAINTAINER Arnaud Wallon (arnaud@netbeat.be)
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apt-utils openjdk-8-jdk-headless wget unzip
RUN wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip
RUN wget https://joinup.ec.europa.eu/sites/default/files/distribution/access_url/2017-11/bb5bbee0-fe78-438b-8510-e712acd92cc9/LEOS-Pilot_1.0.0.zip
RUN unzip apache-maven-3.3.9-bin.zip
RUN unzip LEOS-Pilot_1.0.0.zip
COPY jvm.config ./LEOS-Pilot_1.0.0/.mvn/
RUN export PATH=$PWD/apache-maven-3.3.9/bin:$PATH && \
    export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8 && \
    echo $PATH && \
    cd ./LEOS-Pilot_1.0.0/ && \
    mvn clean install
COPY start-leos.sh ./
RUN chmod +x ./start-leos.sh
EXPOSE 8080
ENTRYPOINT ["./start-leos.sh"]
