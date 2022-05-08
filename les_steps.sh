#!/usr/bin/env bash

# install azure cnab driver
curl https://raw.githubusercontent.com/deislabs/cnab-azure-driver/main/install-in-azure-cloudshell.sh |/bin/bash

# how to use the bundle
porter explain --tag cnabquickstarts.azurecr.io/porter/aks/bundle:latest

# az aks get-credentials --resource-group <rg_name> --name <cluster_name>
az aks get-credentials --resource-group demorg --name democluster

# installing the bundle
porter install --tag cnabquickstarts.azurecr.io/porter/aks/bundle:latest \
-c aks \
--param azure_location=eastus \
--param cluster_name=democluster \
--param kubernetes_version=1.20.13 \
--param node_count=2 \
--param node_vm_size=Standard_D2s_v3 \
--param porter-debug=false \
--param resource_group=demorg \
--param vm_set_type=VirtualMachineScaleSets \
-d azure