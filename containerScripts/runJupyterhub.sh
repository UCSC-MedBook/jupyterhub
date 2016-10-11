#! /bin/bash

set -x -e

jupyterhub --debug -f /config/jupyterhub_config.py
