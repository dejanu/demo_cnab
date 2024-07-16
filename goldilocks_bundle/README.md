# goldilocks  Bundle

WIP to check [kubernetes mixin](https://porter.sh/mixins/kubernetes/#examples) and [helm](https://porter.sh/mixins/helm3/)

### Mixins

```bash
porter mixin install kubernetes
porter mixin install helm3 --feed-url https://mchorfa.github.io/porter-helm3/atom.xml
```
* This is a kubernetes mixin for Porter. It executes the appropriate helm command based on which action it is included within: install, upgrade, or delete.

### Usage
```bash
# Before running a bundle the user must first create a credential set i.e. kubeconfig 
porter credentials generate kubeconfig

# deploy app
porter install -c kubeconfig --verbosity=debug
porter uninstall -c kubeconfig --verbosity=true
```

### Goldilocks

* doc [here](https://goldilocks.docs.fairwinds.com/installation/#requirements)

* Requirements:
    - Metrics Server collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through Metrics API for use by HPA and VPA. Metrics Server is meant only for autoscaling purposes
```bash

# check if metrics server is enabled
kubectl get apiservices | grep metrics.k8s.io
kubectl get --raw /apis/metrics.k8s.io/v1beta1 | jq
```
