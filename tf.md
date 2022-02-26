[]: # Language: markdown
[]: # Path: azure-cli.md
# Azure portal

https://portal.azure.com/#home


# Terraform

```bash
# list of supported Azure Locations: 
westus,westus2,eastus,centralus,centraluseuap,southcentralus,northcentralus,westcentralus,eastus2,eastus2euap,brazilsouth,brazilus,northeurope,westeurope,eastasia,southeastasia,japanwest,japaneast,koreacentral,koreasouth,southindia,westindia,centralindia,australiaeast,australiasoutheast,canadacentral,canadaeast,uksouth,ukwest,francecentral,francesouth,australiacentral,australiacentral2,uaecentral,uaenorth,southafricanorth,southafricawest,switzerlandnorth,switzerlandwest,germanynorth,germanywestcentral,norwayeast,norwaywest,brazilsoutheast,westus3,swedencentral,swedensouth
```

* Providers

- Terraform relies on plugins called "providers" to interact with cloud providers, Terraform Registry includes documentation for a wide range of providers:https://registry.terraform.io/browse/providers

- The provider needs to be configured with the proper credentials before it can be used. The simplest configuration is to specify the kubeconfig path.

* Commands

```bash
terraform init # initialize a working directory containing the Terraform configuration files.

terraform plan # present you the difference between reality at a given time and config you intend to apply
terraform plan -out maint.tfplan # creates an execution plan to a specified output file

terraform apply # apply the changes required to reach the desired state of the configuration.
terraform apply main.tfplan # apply the plan from file e.g. maint.tfplan

# proposed destroy changes without executing them
terraform plan -destroy -out main.destroy.tfplan
terraform apply main.destroy.tfplan
```
