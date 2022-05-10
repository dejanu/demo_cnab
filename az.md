[]: # Language: markdown

## Azure

* [portal](https://portal.azure.com/#home)

* [VM Sizing and pricing](https://azureprice.net/?currency=EUR&region=westeurope&timeoption=hour)
    * nice feature like Accelerated Networking enabled

* [Quotas](https://docs.microsoft.com/en-us/azure/aks/quotas-skus-regions)
    * VM sizes with less than 2 CPUs may not be used with AKS
    * AKS release notes: https://github.com/Azure/AKS/releases

* Product availability by region [VM availability](https://azure.microsoft.com/en-us/global-infrastructure/services/?regions=europe-north,europe-west&products=virtual-machines)    

* [Azure Region Scope](https://azurecharts.com/instances)

* [Create SVP yt](https://www.youtube.com/watch?v=Kf1Tai_BkWU)
* [StackOverflow_post](https://stackoverflow.com/questions/55457349/service-principal-az-cli-login-failing-no-subscriptions-found)

## AZ client

* Service Principal:

```bash
# list service principals
az ad sp list --query "[].{id:id,name:displayName}" --show-mine

# create service principal app_name in AAD + https://stackoverflow.com/questions/55457349/service-principal-az-cli-login-failing-no-subscriptions-found
export mySubscriptionID="3e053c67-dd5c-4904-8ecb-5af26418d771"
az ad sp create-for-rbac --name demoSVP --role contributor --scopes /subscriptions/$mySubscriptionID

# login using sp - username for a service principal is its Application is (client) ID
az login --output json --password <service_principal_password> --service-principal --tenant <AAD_tenant> --username <service_principal>

# reset credentials for service principal will output to STDOUT the new credentials
az ad sp credential reset --name demoSVP

# assign role to SVP
az role assignment create --assignee "object_id" --role "contributor"
```
--

* AKS:

```bash
# azure container registry
az acr login --name dejanualex.azurecr.io
docker tag mcr.microsoft.com/hello-world <mycontainerregistry>.azurecr.io/hello-world:v1
docker tag dejanualex/aks:v0.1.4 dejanualex.azurecr.io/aks:v0.1.4

# get k8s cluster credentials .kube/config
az aks get-credentials --resource-group <resourge_group_name> --name <cluster-name>

# get list of supported Azure Locations: westus,westus2,eastus,centralus northeurope,westeurope
az aks get-versions --location westeurope -o table
```
---

```bash
# demoSVP
{
  "appId": "8a1d9918-ef2b-4070-aebf-bbe2d48395fd",
  "displayName": "demoSVP",
  "password": "2g-yo8bS8ZR1B5gUkPWfcIYu77ozT.ec7K",
  "tenant": "7f6211b1-7c5c-4277-8403-c0ccbd7f0408"
}

export SubscriptionID="3e053c67-dd5c-4904-8ecb-5af26418d771"
# AppID
export azure_client_id="8a1d9918-ef2b-4070-aebf-bbe2d48395fd"
# clientPassword
export azure_client_secret="2g-yo8bS8ZR1B5gUkPWfcIYu77ozT.ec7K"
# directoryID
export azure_tenant_id="7f6211b1-7c5c-4277-8403-c0ccbd7f0408"
```

