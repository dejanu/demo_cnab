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