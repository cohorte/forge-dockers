#!/bin/bash
# This script remove all non used volumes
# Author: bassem debbabi
# http://cohorte.tech
#

docker volume rm $(docker volume ls -qf dangling=true)
