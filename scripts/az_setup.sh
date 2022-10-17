#!/usr/bin/env bash

# SETUP FOR AZURE

# check if .bashrc file exists and if yes source it
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# add porter to path
export PORTER_HOME=~/.porter
export PATH=$PORTER_HOME:$PATH
