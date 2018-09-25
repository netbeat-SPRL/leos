#!/bin/bash
cd /opt/leos/modules/annotate/server
/opt/maven/apache-maven-3.3.9/bin/mvn spring-boot:run -Dspring.profiles.active=h2
