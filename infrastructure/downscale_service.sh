#!/bin/bash

eval $(docker-machine env manager1)
docker service update --replicas 3 distributed-objects-service
