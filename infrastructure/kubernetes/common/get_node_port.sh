#!/bin/bash

NODE_PORT=$(kubectl get services/distributed-objects-app-deployment -o go-template='{{(index .spec.ports 0).nodePort}}')
echo $NODE_PORT
