#!/usr/bin/env bash

az account set --subscription SUBSCRIPTION_ID

az resource list --query "[?resourceGroup=='RESOURCE_GROUP_NAME']" -o table


az vm create --resource-group RESOURCE_GROUP_NAME --name VM_NAME --image UbuntuLTS  --public-ip-sku Standard --admin-username USER_NAME --generate-ssh-keys
