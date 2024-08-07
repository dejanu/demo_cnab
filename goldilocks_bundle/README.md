# goldilocks  Bundle

WIP to check [kubernetes mixin](https://porter.sh/mixins/kubernetes/#examples) and [usage](https://porter.sh/design/kubernetes-mixin/#overview) and [helm](https://porter.sh/mixins/helm3/)

The Kubernetes Mixin provides bundle authors with the ability to apply and delete Kubernetes manifests. The mixin will leverage `kubectl`, similar to how the Helm mixin utilizes the `helm`` command line tool.

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

# actions
porter install -c kubeconfig --verbosity=debug --param goldilocks-namespace=goldilocks

porter invoke --action=deployapp -c kubeconfig --param goldilocks-namespace=goldilocks

porter uninstall -c kubeconfig --verbosity=true --param goldilocks-namespace=goldilocks
```

### Goldilocks

* doc [here](https://goldilocks.docs.fairwinds.com/installation/#requirements)

* Requirements:
    - Metrics Server collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through Metrics API for use by HPA and VPA. Metrics Server is meant only for autoscaling purposes

    - The VPA automatically adjusts the CPU and memory requests and limits for pods based on their usage over time.
    - The VPA must be deployed in each namespace you wish to monitor

```bash
# check if metrics server is enabled
kubectl get apiservices | grep metrics.k8s.io
kubectl get --raw /apis/metrics.k8s.io/v1beta1 | jq .
```

* Expose dashboard: `kubectl -n goldilocks port-forward svc/goldilocks-dashboard 8080:80`
* Label namespace: `kubectl label ns NAMESPACE goldilocks.fairwinds.com/enabled=true`