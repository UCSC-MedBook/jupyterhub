#! /bin/bash

set -x -e

cd /packages/dockerspawner
python setup.py install
jupyterhub --debug -f /config/jupyterhub_config.py