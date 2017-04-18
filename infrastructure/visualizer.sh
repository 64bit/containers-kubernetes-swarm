#!/bin/bash

eval $(docker-machine env manager1)
docker service create \
--name=viz \
--publish=9999:8080/tcp \
--constraint=node.role==manager \
--mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
dockersamples/visualizer
