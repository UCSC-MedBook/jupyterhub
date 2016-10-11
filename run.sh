#! /bin/bash
set -x -e

source ~/.env
getopts ":d" opt || true

export VOLUMES="-v /var/run/docker.sock:/var/run/docker.sock -v `pwd`/config:/config -v /etc/letsencrypt/archive/medbook.zoomdaisy.com:/cert"
export ENV_VARS="-e GITHUB_OAUTH_ID=$GITHUB_OAUTH_ID -e GITHUB_OAUTH_SECRET=$GITHUB_OAUTH_SECRET -e GITHUB_OAUTH_CALLBACK=$GITHUB_OAUTH_CALLBACK"

export COMMAND="/scripts/runJupyterhub.sh"
if [ "$opt"="d" ]
then
  export VOLUMES="$VOLUMES -v `pwd`/dockerspawner:/packages/dockerspawner -v `pwd`/containerScripts:/scripts"
fi

docker run -it --rm --name jupyterhub -p 0.0.0.0:443:443 $VOLUMES $ENV_VARS medbook/jupyterhub $COMMAND
