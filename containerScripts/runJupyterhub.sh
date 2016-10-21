#! /bin/bash

set -x -e

# jupyterhub --debug --no-ssl -f /config/jupyterhub_config.py
jupyterhub --no-ssl -f /config/jupyterhub_config.py
