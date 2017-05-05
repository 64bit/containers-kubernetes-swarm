#!/bin/bash

tag=$1
if [[ -z "${tag}" ]]
then
  TAG=":latest"
else
  TAG=":$tag"
fi

docker build -t gigapotential/distributed-objects-app$TAG .
