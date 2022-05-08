

* Subscriptiond and service principal:

```bash

# Azure 18929-01 SRE Internet DevTest 1   AzureCloud   33412aad-8988-47c9-a0ae-0c95efad1811

# list service principals
az ad sp list --query "[].{id:id,name:displayName}" --show-mine


# Create a service principal for a resource group using a preferred name and role
export mySubscriptionID="3412aad-8988-47c9-a0ae-0c95efad1811"
az ad sp create-for-rbac --name alexSVP --role contributor --scopes /subscriptions/$mySubscriptionID

# reset credentials for service principal
az ad sp credential reset --name alexSVP


az role assignment create --assignee "object_id" --role "contributor"

{
  "appId": "849f0955-0bb4-4c75-9f8d-194cf073984d",
  "name": "alexSVP",
  "password": "SUW0rlE5Mv2Iws6I70-zYiExdix2ibCCKJ",
  "tenant": "7f6211b1-7c5c-4277-8403-c0ccbd7f0408"
}
```

