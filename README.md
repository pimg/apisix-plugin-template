# Template repository for APISIX custom plugin
This repository acts as a template for developing custom plugins for APISIX. It used the APISIX docker container to test and run the plugins locally so no local install of APISIX is needed. 

## Usage
In order to use this template click `Use this template` and create your own repository based on this template. 

### Layout and customizations
The template runs APISIX in standalone mode, so no ETCD is needed. 
There are three subdirectories of this template:
- conf
- logs
- src

The `conf` directory contains the configuration files for APISIX to run and configure in standalone mode. The template offers a minimal configuration to get you up and running. 

The `logs` directory contains the log files (access.log and error.log) from the container for easier troubleshooting. 

The `src` directory contains the source code for the custom plugin. Here you can place your lua files and subdirecties for developing your custom plugin. For more information regarding the development of a custom APISIX plugin see the official docs: https://apisix.apache.org/docs/apisix/plugin-develop/


The directories mentioned above are mounted in the container as follows:
conf/config.yaml -> /usr/local/apisix/conf/config.yaml
conf/apisix.yaml -> /usr/local/apisix/conf/apisix.yaml
logs/ -> /usr/local/apisix/logs
src/ -> /usr/local/apisix/custom-plugins

### Running your local plugin
APISIX containing your custom configuration and plugin are run using the APISIX Docker container. While perfectly possible to use the Docker CLI to run APISIX a Makefile is created for convenience. 

The Makefile contains the following commands:
- dev-startup -> creates and start the docker container with the appropriate volume mounts
- dev-start -> starts an existing container
- dev-stop -> stops the container
- dev-rm -> removes the container
- dev-reload -> issues the `apisix reload` command inside the container

When the container is started a container with the name of `apache-apisix-standalone` is run. 

To run the container:
```shell
make dev-startup
```