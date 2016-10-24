#! /bin/bash

set -x -e

./deleteAll.sh
. ~/.env
docker-compose up
