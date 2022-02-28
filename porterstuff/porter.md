
# Porter

* Install porter:
```bash
curl -L https://cdn.porter.sh/latest/install-linux.sh | bash
export PATH=$PATH:~/.porter
```
* Create and build bundle:

```bash
# Create a bundle. This generates a porter bundle in the current directory.
porter create --help
porter create

# Builds the bundle in the current directory by generating a Dockerfile 
# and a CNAB bundle.json, and then building the invocation image.
porter build
```
* Use azure:
```bash

curl https://raw.githubusercontent.com/deislabs/cnab-azure-driver/main/install-in-azure-cloudshell.sh |/bin/bash
source .bashrc
```

* Mixins and Plugins:

```bash

### MIXINS are the building blocks that you use when authoring bundles

# mixins command: build, install, upgrade
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

- https://github.com/Azure/azure-cnab-quickstarts
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
porter credentials generate --tag cnabquickstarts.azurecr.io/porter/aks/bundle:latest

# credentials example bundle requires credential for azure_client_id
# Credentials are never stored by Porter - https://porter.sh/quickstart/credentials/
# Credentials can be specified using --cred <path-to-creds-file> or --cred <credentials_set_name>
porter credentials list

# install bundle with required params
porter install --tag cnabquickstarts.azurecr.io/porter/aks/bundle:latest -d azure -c 

porter install --tag cnabquickstarts.azurecr.io/porter/aks/bundle:latest --cred aks-aad-oauth-proxy -d azure --param aad_application_name=myapp --param aad_application_secret=53cret! --param fqdn=myapp.microsoft.com
```

```bash
# install bundle quick
porter install --tag cnabquickstarts.azurecr.io/porter/aks/bundle:latest \
-c aks \
--param azure_location=eastus \
--param cluster_name=democluster \
--param kubernetes_version=1.20.13 \
--param node_count=2 \
--param node_vm_size=Standard_D2s_v3 \
--param porter-debug=false \
--param resource_group=demorg \
--param vm_set_type=VirtualMachineScaleSets \
-d azure
```
Params:

aad_application_name     Name for the Azure AD application that will be created  
aad_application_secret   Secret (password) for the Azure AD application that will be created       
fqdn                     Fully qualified domain name                                           
ingress_class            The type of ingress controller to use for the proxy ingress   (default nginx)              
namespace                Kubernetes namespace for installation                                 
porter-debug             Print debug information from Porter when executing the bundle            
tls_secret_name          Name for TLS secret for oauth2-proxy ingress     

--param aad_application_name=demoapp \
--param aad_application_secret=53cret! \
--param fqdn=demoapp.microsoft.com \
--param ingress_class=ngnix \
--param namespace=aad-oauth2-proxy \
--param porter-debug=false \
--param tls_secret_name=oauth2-proxy.tls 
-------------------------------------------------------------------------------------------------------------------------------------------------
azure_location       The Azure location to create the resources in   
cluster_name         The name to use for the AKS Cluster                             
kubernetes_version   The Kubernetes version to use (default 1.16.7)               
node_count           The VM size to use for the cluster (default 4)                     
node_vm_size         The VM size to use for the cluster (default Standard_D8s_v3)
porter-debug         Print debug information from Porter when executing the bundle  (default false )  
resource_group       The name of the resource group to create the AKS Cluster in     
vm_set_type          Agent pool VM set type   (default    VirtualMachineScaleSets)

--param azure_location=eastus \
--param cluster_name=democluster \
--param kubernetes_version=1.20.13 \
--param node_count=2 \
--param node_vm_size=Standard_D2s_v3 \
--param porter-debug=false \
--param resource_group=demorg \
--param vm_set_type=VirtualMachineScaleSets
