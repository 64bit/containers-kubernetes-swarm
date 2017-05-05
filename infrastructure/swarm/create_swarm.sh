#!/bin/bash

source ./config.cfg

#  Swarm Init
docker-machine ssh manager1 docker swarm init --advertise-addr $(docker-machine ip manager1)

SWARM_MANAGER_JOIN_CMD=$(docker-machine ssh manager1 docker swarm join-token manager | tail -n 4 | head -n 3 | tr --delete '\\')

# Add additional managers
for i in $(seq 2 $MANAGER); 
do 
  docker-machine ssh manager$i $SWARM_MANAGER_JOIN_CMD 
 done

SWARM_JOIN_CMD=$(docker-machine ssh manager1 docker swarm join-token worker | tail -n 4 | head -n 3 | tr --delete '\\')

# Add workers
for i in $(seq 1 $WORKER); 
do 
  docker-machine ssh worker$i $SWARM_JOIN_CMD 
done
