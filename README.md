## Repo for demo

Every deplyment is a snowflake

- [dockerhub](https://hub.docker.com/repositories)
- [Azure portal](https://portal.azure.com/#home)
### Content:

- [Azure](az.md)
- [Terraform](/terraformstuff/tf.md)
- [Porter](/porterstuff/porterstuff.md)

## Bundles:

### dependencies:

[Docker mixin](https://porter.sh/examples/docker/)

```bash

# porter mixins install NAME [flags]
porter mixins install docker
porter mixins list

# the app
docker run docker/whalesay cowsay MUCH WOW

porter install --reference getporter/whalesay:v0.1.2 --allow-docker-host-access

porter invoke whalesay --action=say --param 'msg=MUCH WOW!' --allow-docker-host-access

porter uninstall --reference getporter/whalesay:v0.1.2 --allow-docker-host-access

```

* Nice links:
https://book.kubebuilder.io/
https://opensource.com/article/17/7/how-linux-containers-evolved