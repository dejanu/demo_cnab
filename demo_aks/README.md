## Usage

```bash
# generate credentials (after creating env vars)
porter credentials generate aks

porter install -c aks --param rg_name=sre-hackathon --param aks_name=demoaks
```