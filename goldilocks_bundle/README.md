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
porter install -c kubeconfig --verbosity=debug 

porter invoke --action=deployapp -c kubeconfig --verbosity=debug

porter uninstall -c kubeconfig --verbosity=true --param goldilocks-namespace=goldilocks

# distribute the bundle (docker login registry.admin.cops.systematic-ops.com)
porter publish 

```

### Goldilocks

* doc [here](https://goldilocks.docs.fairwinds.com/installation/#requirements)

* Requirements:
    - Metrics Server collects resource metrics from Kubelets and exposes them in Kubernetes apiserver through Metrics API for use by HPA and VPA. Metrics Server is meant only for autoscaling purposes
    ```bash
    # check if metrics server is enabled
    kubectl get apiservices | grep metrics.k8s.io
    kubectl get --raw /apis/metrics.k8s.io/v1beta1 | jq .
    ```

    - The VPA automatically adjusts the CPU and memory requests and limits for pods based on their usage over time.
    - The VPA must be deployed in each namespace you wish to monitor otherwise one will encounter the error:
    ```bash
    E1010 10:40:47.380921       1 vpa.go:98] the server could not find the requested resource (get verticalpodautoscalers.autoscaling.k8s.io)
    E1010 10:40:47.380936       1 pod.go:48] Error reconciling: the server could not find the requested resource (get verticalpodautoscalers.autoscaling.k8s.io)
    ```


* Expose dashboard: `kubectl -n goldilocks port-forward svc/goldilocks-dashboard 8080:80`
* Label namespace: `kubectl label ns NAMESPACE goldilocks.fairwinds.com/enabled=true`

### Publish the bundle

```bash
porter build --dir /path/to/porter.yaml

porter publish docker.io/dejanualex/porter-gold:v1.0.0

# generate gzipped tar archive containing the bundle + invocation image + referenced images
porter archive goldilocks-v1.0.0.tgz --reference dejanualex/porter-gold:v1.0.0
```