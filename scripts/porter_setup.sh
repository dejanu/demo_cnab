#!/usr/bin/env bash

# SETUP FOR AZURE

# check if .bashrc file exists and if yes source it
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#unable to instantiate driver: extension "io.cnab.docker" is required but allow-docker-host-access was not enabled 
export PORTER_ALLOW_DOCKER_HOST_ACCESS=true
# add porter to path
export PORTER_HOME=~/.porter
export PATH=$PORTER_HOME:$PATH

