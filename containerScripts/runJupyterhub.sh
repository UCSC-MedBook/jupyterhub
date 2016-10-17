#! /bin/bash

set -x -e

jupyterhub --debug --no-ssl -f /config/jupyterhub_config.py
