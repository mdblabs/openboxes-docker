#!/bin/bash
apt-get update -yq 
apt-get install curl gnupg -yq 
curl -sL https://deb.nodesource.com/setup_8.x | bash 
apt-get install nodejs -yq

npm install

if [ ! -f /app/web-app/WEB-INF/applicationContext.xml ]; then
   echo "Forcing grails upgrade"
   grails upgrade --force
fi

grails run-app
