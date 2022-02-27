[]: # Language: markdown

# Azure portal

https://portal.azure.com/#home

# AZ client

```bash
# get k8s cluster credentials .kube/config
az aks get-credentials --resource-group <resourge_group_name> --name <cluster-name>

#login 
# username for a service principal is its Application is (client) ID
az login --output json --password <service_principal_password> --service-principal --tenant <AAD_tenant> --username <service_principal>

```

```bash
# list of supported Azure Locations: 
westus,westus2,eastus,centralus,centraluseuap,southcentralus,northcentralus,westcentralus,eastus2,eastus2euap,brazilsouth,brazilus,northeurope,westeurope,eastasia,southeastasia,japanwest,japaneast,koreacentral,koreasouth,southindia,westindia,centralindia,australiaeast,australiasoutheast,canadacentral,canadaeast,uksouth,ukwest,francecentral,francesouth,australiacentral,australiacentral2,uaecentral,uaenorth,southafricanorth,southafricawest,switzerlandnorth,switzerlandwest,germanynorth,germanywestcentral,norwayeast,norwaywest,brazilsoutheast,westus3,swedencentral,swedensouth
```