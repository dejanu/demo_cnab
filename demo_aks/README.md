## Usage

```bash
# generate credentials (after creating env vars)
porter credentials generate aks
porter install -c aks --param rg_name=sre-hackathon --param aks_name=demoaks

# create creds
porter creds generate aksset

# update de json and create creds set
porter creds apply aksset.json
porter install -c akscreds --param rg_name=sre-hackathon --param aks_name=demoaks

porter upgrade -c aks --param rg_name=sre-hackathon --param aks_name=demoaks

porter uninstall -c aks --param rg_name=sre-hackathon --param aks_name=demoaks
```