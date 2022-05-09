
# Porter

* Install porter:
```bash
curl -L https://cdn.porter.sh/latest/install-linux.sh | bash

# porter home
export PORTER_HOME=~/.porter
export PATH=$PORTER_HOME:$PATH
```


* Create and build bundle:
```bash
# Create a bundle. This generates a porter bundle in the current directory.
porter create --help

# Builds the bundle in the current directory by generating a Dockerfile 
# and a CNAB bundle.json, and then building the invocation image.
porter build
```
* Use azure:
```bash
# installing CNAB azure driver .bashrc updated added cnab-azure-driver dir to path
# Installed  cnab-azure version:v0.0.9-c3fac30
curl https://raw.githubusercontent.com/deislabs/cnab-azure-driver/main/install-in-azure-cloudshell.sh |/bin/bash
source .bashrc
```

* Mixins and Plugins:
```bash
### MIXINS are the building blocks that you use when authoring bundles

# porter mixins install NAME [flags]
# mixins command: build, install, upgrade
porter mixins install docker
porter mixins list
porter mixin install terraform

----------------------------
## PLUGINS extend the porter client, by reimplementing porter's default functionality 
## e.g. Porter saves installation data, credential sets and parameter sets using the local filesystem to ~/.porter by ### default. A plugin can change that behavior to save them to cloud storage instead

#list installed plugins 
porter plugins list

#install azure plugin
porter plugin install azure
```

* Resources:

- [Main repo](https://github.com/Azure/azure-cnab-quickstarts)
- [Quickstarts List](https://github.com/Azure/azure-cnab-quickstarts/blob/main/porter/TOC.md)
- https://porter.sh/mixins/terraform/
- https://www.youtube.com/watch?v=LxRvKg3egPc
- https://tanzu.vmware.com/content/blog/cloud-native-application-bundles-a-simple-way-to-install-software-on-kubernetes-or-any-other-runtime
- https://www.youtube.com/watch?v=1FGMrv_xfqY&t=8s

* Porter in az shell:

```bash
# check params and credentials used by bundle
porter explain --tag cnabquickstarts.azurecr.io/porter/aks/bundle:latest

# if bundle requires credentials, you must generate a credentials file with the required values.
porter credentials generate --tag cnabquickstarts.azurecr.io/porter/<quickstart-name>/bundle:<quickstart-version>
porter credentials generate --reference cnabquickstarts.azurecr.io/porter/aks/bundle:latest

# credentials example bundle requires credential for azure_client_id
# Credentials are never stored by Porter - https://porter.sh/quickstart/credentials/
# Credentials can be specified using --cred <path-to-creds-file> or --cred <credentials_set_name>
porter credentials list

# install bundle with required params and credentials

porter install --reference cnabquickstarts.azurecr.io/porter/aks/bundle:latest -c aks --param azure_location=westeurope --param cluster_name=democluster --param kubernetes_version=1.21.9 --param node_count=2 --param node_vm_size=standard_d2as_v5 --param porter-debug=false --param resource_group=demorg --param vm_set_type=VirtualMachineScaleSets -d azure
```

* Check bundles:

```bash
# list bundles
porter list

# check bundle usage
porter explain --reference registry/bundle:version
```

