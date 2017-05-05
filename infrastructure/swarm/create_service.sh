#!/bin/bash

eval $(docker-machine env manager1)

# create overlay network
docker network rm distributed-objects-network
docker network create --driver overlay distributed-objects-network

# create service
docker service create --replicas 3 --publish 8080:80 --network distributed-objects-network --name distributed-objects-service gigapotential/distributed-objects-app 
