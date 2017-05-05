#!/bin/bash

eval $(docker-machine env manager1)
docker run  \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8888:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest

