#!/bin/bash

eval $(docker-machine env manager1)
docker service rm  distributed-objects-service 
