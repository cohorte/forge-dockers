#!/bin/bash
# This script allows you to backup a container and its data volumes.
# Author: bassem debbabi
# http://cohorte.tech
#
CONTAINER_NAME=$1
SNAPSHOT_NAME=$2
BACKUP_DIR=$(pwd)

usage() {
  echo "Usage: $0 [container name] [snapshot name]"
  exit 1
}

if [ -z $CONTAINER_NAME ]
then
  echo "Error: missing container name parameter."
  usage
fi

if [ -z $SNAPSHOT_NAME ]
then
  echo "Error: missing snapshot name parameter."
  usage
fi

# get volumes list
docker inspect --format='{{range $mount := .Mounts}}{{$mount.Destination}}{{" "}}{{end}}' $CONTAINER_NAME > volumes_${SNAPSHOT_NAME}.tmp
VOLUMES=$(cat volumes_${SNAPSHOT_NAME}.tmp)
rm -rf volumes_${SNAPSHOT_NAME}.tmp

# stop container
echo "---- stopping container: $CONTAINER_NAME_$SNAPSHOT_NAME"
docker stop $CONTAINER_NAME

# archive container
echo "---- backing-up new image: $CONTAINER_NAME_$SNAPSHOT_NAME"
docker export --output="$CONTAINER_NAME_$SNAPSHOT_NAME.tar" $CONTAINER_NAME
#docker commit $CONTAINER_NAME $CONTAINER_NAME_$SNAPSHOT_NAME

# archive data volumes
echo "---- backing-up the following volumes: $VOLUMES"
docker run --rm --volumes-from $CONTAINER_NAME -v ${BACKUP_DIR}:/backup ubuntu tar cvf /backup/backup_${SNAPSHOT_NAME}.tar $VOLUMES

# start container
echo "---- restarting container: $CONTAINER_NAME"
docker start $CONTAINER_NAME
