#! /bin/bash
set -x -e

source ~/.env
printenv
getopts ":d" opt || true

export VOLUMES="-v /var/run/docker.sock:/var/run/docker.sock -v `pwd`/config:/config -v /etc/letsencrypt/archive/medbook.zoomdaisy.com:/cert"
export ENV_VARS="-e GITHUB_OAUTH_ID=$GITHUB_OAUTH_ID -e GITHUB_OAUTH_SECRET=$GITHUB_OAUTH_SECRET -e GITHUB_OAUTH_CALLBACK=$GITHUB_OAUTH_CALLBACK"

if [ "$opt" -eq "d"]
then
  export command="something else"
else
  export command="jupyterhub --debug -f /config/jupyterhub_config.py"
fi

docker run -it --rm --name jupyterhub -p 0.0.0.0:443:443 $VOLUMES $ENV_VARS medbook/jupyterhub $command
