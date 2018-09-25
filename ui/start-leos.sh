#!/bin/bash
echo $CMIS_SERVER
echo $ANNOTATE_SERVER
echo $USER_REPOSITORY

cd /opt/leos/modules/config/src/main/filters/os

sed "s/localhost\:9090/`echo $CMIS_SERVER`/g" local.properties > local-new.properties
mv local-new.properties local.properties

sed "s/localhost\:9099/`echo $ANNOTATE_SERVER`/g" local.properties > local-new.properties
mv local-new.properties local.properties

sed "s/localhost\:9095/`echo $USER_REPOSITORY`/g" local.properties > local-new.properties
mv local-new.properties local.properties

more /opt/leos/modules/config/src/main/filters/os/local.properties

export PATH=/opt/maven/apache-maven-3.3.9/bin:$PATH
export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8

echo $PATH

cd /opt/leos/
mvn clean install

cd /opt/leos/modules/web
mvn jetty:run-war
