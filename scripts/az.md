[]: # Language: markdown

## Azure

🖱️ [Azure portal](https://portal.azure.com/#home)

✔️ [Check Azure status](https://status.azure.com/en-us/status)

✔️ [New Azure status](https://azure.status.microsoft/en-us/status)

✔️ [Azure VM Sizing and pricing](https://azureprice.net/)

✔️ [Product availability by region](https://azure.microsoft.com/en-us/explore/global-infrastructure/products-by-region/)

✔️ [Azure Region Scope](https://azurecharts.com/instances)

---

### Links

* [Quotas](https://docs.microsoft.com/en-us/azure/aks/quotas-skus-regions)
    * VM sizes with less than 2 CPUs may not be used with AKS
    * AKS release notes: https://github.com/Azure/AKS/releases

* [Create SVP yt](https://www.youtube.com/watch?v=Kf1Tai_BkWU)
* [StackOverflow_post](https://stackoverflow.com/questions/55457349/service-principal-az-cli-login-failing-no-subscriptions-found)

### AZ CLI

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

# create AKS cluster
az aks create -g <resourge_group_name> -n <cluster-name> --generate-ssh-keys
az aks delete -g <resourge_group_name> -n <cluster-name> --yes

# get k8s cluster credentials .kube/config
az aks get-credentials --resource-group <resourge_group_name> --name <cluster-name>

# get list of supported Azure Locations: westus,westus2,eastus,centralus northeurope,westeurope
az aks get-versions --location westeurope -o table
```
---

```bash
# demoSVP
{
  "appId": "",
  "name": "demoSVP",
  "password": "",
  "tenant": ""
}

export SubscriptionID=""
# AppID
export azure_client_id=""
# clientPassword
export azure_client_secret=""
# directoryID
export azure_tenant_id=""
```

To access resources that are secured by a Microsoft Entra tenant, the entity that requires access must be represented by a security principal. 
This requirement is true for both users (user principal) and applications (service principal).

There are three types of service accounts native to Microsoft Entra ID: 
Managed identities (Managed identities can't be used for services hosted outside of Azure)
service principals (recomended for services not hosted in Azure, otherwise go to managed identities)
user-based service accounts 


A service principal is the local representation of an application object in a single Microsoft Entra tenant.
There are two mechanisms for authentication using service principals: client certificates and client secrets.