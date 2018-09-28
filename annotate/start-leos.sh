#!/bin/bash
echo $ANNOTATE_SERVER
echo $USER_REPOSITORY

cd /opt/leos/modules/annotate/server/src/main/filters

sed "s/localhost\:9099/`echo $ANNOTATE_SERVER`/g" local.properties > local-new.properties
mv local-new.properties local.properties

sed "s/localhost\:9095/`echo $USER_REPOSITORY`/g" local.properties > local-new.properties
mv local-new.properties local.properties

more /opt/leos/modules/annotate/server/src/main/filters/local.properties

export PATH=/opt/maven/apache-maven-3.3.9/bin:$PATH
export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8

echo $PATH

cd /opt/leos/modules/annotate
mvn clean install

cd /opt/leos/modules/annotate/server
mvn spring-boot:run -Dspring.profiles.active=h2
