#! /bin/bash

set -x -e

cd /packages/dockerspawner
pip install .
jupyterhub --debug -f /config/jupyterhub_config.py
