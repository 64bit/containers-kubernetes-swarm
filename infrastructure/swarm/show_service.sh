#!/bin/bash

eval $(docker-machine env manager1)
docker service ps distributed-objects-service 
