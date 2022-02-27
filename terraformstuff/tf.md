[]: # Language: markdown
[]: # Path: azure-cli.md
# Azure portal

https://portal.azure.com/#home


# Terraform

* Current setup:
- Will create a azure resource group
- Will create an AKS cluster
- Will create an Azure container registry

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
