## Usage
```bash
# create env vars
export AZURE_CLIENT_ID=""
export AZURE_TENANT_ID=""
export AZURE_CLIENT_SECRET=""
export AZURE_SUBSCRIPTION_ID=""

# generate creds set interactively
porter credentials generate aks
porter install -c aks --param rg_name=sre-hackathon --param aks_name=demoaks

# create creds: porter creds generate aksset

# update de json and create creds set
porter creds apply aksset.json
porter install -c akscreds --param rg_name=sre-hackathon --param aks_name=demoaks

porter upgrade -c akscreds --param rg_name=sre-hackathon --param aks_name=demoaks

porter uninstall -c akscreds --param rg_name=sre-hackathon --param aks_name=demoaks

# invoke custom action merge 
porter invoke --action=merge -c akscreds --param rg_name=sre-hackathon --param aks_name=demoaks
```