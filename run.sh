#! /bin/bash
set -x -e

source ~/.env

export VOLUMES="-v /var/run/docker.sock:/var/run/docker.sock -v `pwd`/config:/config -v $SSL_CERT:/cert/cert -v $SSL_KEY:/cert/key"
export ENV_VARS="-e GITHUB_OAUTH_ID=$GITHUB_OAUTH_ID -e GITHUB_OAUTH_SECRET=$GITHUB_OAUTH_SECRET -e GITHUB_OAUTH_CALLBACK=$GITHUB_OAUTH_CALLBACK"

export COMMAND="/scripts/runJupyterhub.sh"

docker run -it --rm --name jupyterhub -p 0.0.0.0:443:443 $VOLUMES $ENV_VARS medbook/jupyterhub $COMMAND
