#!/usr/bin/env bash

# source setup with env vars
source az_setup.sh

# how to use the bundle
porter explain --reference cnabquickstarts.azurecr.io/porter/aks/bundle:latest


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

# installing the bundle part2
porter install --reference cnabquickstarts.azurecr.io/porter/aks/bundle:latest -c ./aks-creds.json --param azure_location=westeurope --param cluster_name=democluster --param kubernetes_version=1.21.9 --param node_count=2 --param node_vm_size=standard_d2as_v5 --param porter-debug=false --param resource_group=demorg --param vm_set_type=VirtualMachineScaleSets -d azure

# az aks get-credentials --resource-group <rg_name> --name <cluster_name>
az aks get-credentials --resource-group demorg --name democluster