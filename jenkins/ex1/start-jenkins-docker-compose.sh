#! /bin/bash

JENKINS_HOME=~/jenkins-home
echo "Start Jenkins In folder: $JENKINS_HOME" 
if [ ! -d "$JENKINS_HOME" ]; then
	echo "Folder $JENKINS_HOME is missing. Try to create it."
	mkdir $JENKINS_HOME
	if [ ! -d "$JENKINS_HOME" ]; then
		echo "Cannot create Jenkins home"
		exit 1
	fi
fi

# docker compose build
docker compose up 
