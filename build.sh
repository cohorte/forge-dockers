#!/bin/sh 
# build docker on jenkins or locally 

USERNAME=$1
PASSWORD=$2
TARGET_FORGE="dims.awensys.com"

echo ">>>> building deployer image done"

if [ -f "/usr/local/bin/docker" ] || [ -f "/usr/bin/docker" ]
then 
	echo "build deployer"
	echo "build_docker.sh $USERNAME $PASSWORD"
	bash build_docker.sh $USERNAME $PASSWORD 


else
	
	echo "build deployer"
	echo "Target Nexus: $TARGET_NEXUS"
	ssh -i /root/.ssh/id_rsa -o StrictHostKeyChecking=no  root@${TARGET_FORGE} "bash /var/volumes/jenkins/workspace/docker/tomcat/build_docker.sh $USERNAME $PASSWORD "
fi

