#!/bin/bash

DIR="`dirname \"$0\"`"
DIRECTORY="$DIR/httpd"
DOCKER_REPOSITORY="cohorte/forge_httpd"
DOCKER_TAG="2.4"

echo -e "\x1B[1;32m[INFO] Building Image [$DOCKER_REPOSITORY:$DOCKER_TAG] located on [$DIRECTORY]\x1B[0m"

DIR="`dirname \"$0\"`"
bash $DIR/build_image.sh "$DIRECTORY" "$DOCKER_REPOSITORY" "$DOCKER_TAG" $@
