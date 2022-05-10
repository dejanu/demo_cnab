#!/usr/bin/env bash

# setup for azure environment

# check if .bashrc file exists and if yes source it
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# add porter to path
export PORTER_HOME=~/.porter
export PATH=$PORTER_HOME:$PATH

# credentials to be consumed by the bundle
export SubscriptionID="3e053c67-dd5c-4904-8ecb-5af26418d771"
export azure_client_id="8a1d9918-ef2b-4070-aebf-bbe2d48395fd"
export azure_client_secret="2g-yo8bS8ZR1B5gUkPWfcIYu77ozT.ec7K"
export azure_tenant_id="7f6211b1-7c5c-4277-8403-c0ccbd7f0408"