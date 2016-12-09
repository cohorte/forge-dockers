#!/bin/bash
# This script remove all non used images
# Author: bassem debbabi
# http://cohorte.tech
#

docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
