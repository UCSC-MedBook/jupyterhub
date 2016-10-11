#! /bin/bash
set -x -e
docker ps -aq | xargs docker rm -f
