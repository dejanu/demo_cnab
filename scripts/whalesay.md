## Demo:

* Steps:

```bash
# run the app
docker run dejanualex/dockersay:1.0 cowsay DEMOOOBABY

# create bundle
porter create

# build bundle
porter build

# invoke bundle
# unable to instantiate driver: extension "io.cnab.docker" is required but allow-docker-host-access was not enabled export PORTER_ALLOW_DOCKER_HOST_ACCESS=true
porter install --allow-docker-host-access
porter uninstall --allow-docker-host-access
porter invoke --action=say --param msg="Devafterwork" --allow-docker-host-access

# distribute bundle using semantic version # dejanualex/devafterdemo:v1.0.0
porter publish
porter explain --reference <MANIFEST>
porter install --reference <MANIFEST>
porter invoke --action=say --param msg="Devafterwork" --reference <MANIFEST>
```

* Links:

[Docker mixin](https://porter.sh/examples/docker/)