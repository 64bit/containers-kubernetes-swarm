#!/bin/bash

eval $(docker-machine env manager1)
docker service update --replicas 10 distributed-objects-service
