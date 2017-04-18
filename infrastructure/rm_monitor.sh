#!/bin/bash

eval $(docker-machine env manager1)
docker rm -f  cadvisor

