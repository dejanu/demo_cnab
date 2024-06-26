# Porter

## Concepts

* **bundle**: app artifact, client tools, configuration, and deployment logic packed together… more exactly is a standard packaging format for multi-component distributed applications

* **installation**: an instance of a bundle installer to your system

* **tag**: a reference to the bundle in an OCI registry that contains the registry, bundle name, and version e.g.: `myregistry.com/mybundle:v1.0`

* **registry**: An OCI-compliant artifact store

* So bundles besides including the tools and logic also have the deployment logs aka operations on the runtime-environment.

## Install porter:
```bash
# install porter
curl -L https://cdn.porter.sh/latest/install-linux.sh | bash
curl -L https://cdn.porter.sh/latest/install-mac.sh | bash

# porter home
export PORTER_HOME=~/.porter
export PATH=$PORTER_HOME:$PATH

# installing CNAB azure driver .bashrc updated added cnab-azure-driver dir to path
# Installed  cnab-azure version:v0.0.9-c3fac30
curl https://raw.githubusercontent.com/deislabs/cnab-azure-driver/main/install-in-azure-cloudshell.sh |/bin/bash
source .bashrc
```
## CLI CMDs:

* client side

```bash
# install bundle
porter install porter-hello --reference ghcr.io/getporter/examples/porter-hello:v0.2.0

# list bundle installations
porter list

# see information about an installation
porter show <installation_name>

# see the description of the bundle, actions and parameters + dependecies and outputs of the bundle
porter explain <installation_name>

# bundle in an OCI registry specified by the given reference
porter explain  --reference ghcr.io/getporter/examples/porter-hello:v0.2.0
porter explain --reference registry/bundle:version

# check params and credentials used by bundle
porter explain --tag cnabquickstarts.azurecr.io/porter/aks/bundle:latest

# upgrade bundle
porter upgrade <installation_name>

# uninstall bundle
porter uninstall <installation_name>

# The v1 prerelease of porter has fixed the behavior you are seeing. Otherwise if you are using v0.38 then you should expect to need two repositories per bundle (one for the bundle and one for the bundle’s container)
porter --version
```

## Create and build bundle:

* Manifest specs: https://getporter.org/bundle/manifest/

```bash
# create scaffolding for a new bundle in the current directory
porter create

# create a bundle by taking a user-provided porter.yaml manifest and generate a CNAB bundle.json (in a newly created dir ./cnab that stores all the information e.g. Dockerfile bundle.json) and then building the invocation image
porter build

Copying porter runtime ===>
Copying mixins ===>
Copying mixin exec ===>
Building invocation image ===>


# if bundle requires credentials, you must delete/edit/generate/list/show a credentials file with the required values.
porter credentials generate --reference cnabquickstarts.azurecr.io/porter/aks/bundle:latest
porter credentials list

# store the creds
porter credentials show aks --output json > aks-creds.json

# Credentials can be specified using --cred <path-to-creds-file> or --cred <credentials_set_name>
porter install --reference cnabquickstarts.azurecr.io/porter/aks/bundle:latest -c ./aks-creds.json

# install bundle in Azure with required params and credentials
porter install --reference cnabquickstarts.azurecr.io/porter/aks/bundle:latest -c aks --param azure_location=westeurope --param cluster_name=democluster --param kubernetes_version=1.21.9 --param node_count=2 --param node_vm_size=standard_d2as_v5 --param porter-debug=false --param resource_group=demorg --param vm_set_type=VirtualMachineScaleSets -d azure

# login to cluster
az aks get-credentials --resource-group <resourge_group_name> --name <cluster-name>

```
---

## Mixins and Plugins:

* MIXINS are the building blocks that you use when authoring bundles:

```bash
# porter mixins install NAME [flags]
# mixins command: build, install, upgrade
porter mixins install docker
porter mixin install terraform
porter mixins list
```

* PLUGINS extend the porter client, by reimplementing porter's default functionality 
```bash
## e.g. Porter saves installation data, credential sets and parameter sets using the local filesystem to ~/.porter by default. A plugin can change that behavior to save them to cloud storage instead

#list installed plugins 
porter plugins list

#install azure plugin
porter plugin install azure
```
---
## Setup:

[Docker mixin](https://porter.sh/examples/docker/)

```bash
# run the app
docker run dejanualex/dockersay:1.0 cowsay DEMOOOBABY
```

```bash
# porter mixins install NAME [flags]
porter mixins install docker
porter mixins list

# publish the bundle
porter explain --reference dejanualex/bundlecodecamp:v1.0.0
porter install --reference dejanualex/bundlecodecamp:v1.0.0 --allow-docker-host-access
porter invoke --action=say --param msg="CODECAMP" --reference dejanualex/bundlecodecamp:v1.0.0 --allow-docker-host-access

# the app
docker run docker/whalesay cowsay MUCH WOW

porter install --reference getporter/whalesay:v0.1.2 --allow-docker-host-access
porter invoke whalesay --action=say --param 'msg=MUCH WOW!' --allow-docker-host-access
porter uninstall --reference getporter/whalesay:v0.1.2 --allow-docker-host-access
```

##  Resources:

- [Main repo](https://github.com/Azure/azure-cnab-quickstarts)
- [Quickstarts List](https://github.com/Azure/azure-cnab-quickstarts/blob/main/porter/TOC.md)
- [Terraform_mixin](https://porter.sh/mixins/terraform/)
- [Terraform CNAB](https://www.youtube.com/watch?v=LxRvKg3egPc)
- [Tanzu CNAB](https://tanzu.vmware.com/content/blog/cloud-native-application-bundles-a-simple-way-to-install-software-on-kubernetes-or-any-other-runtime)
- [CNAB_Webinar](https://www.youtube.com/watch?v=1FGMrv_xfqY&t=8s)
- [Porter boiler plate](https://github.com/getporter/examples/)


