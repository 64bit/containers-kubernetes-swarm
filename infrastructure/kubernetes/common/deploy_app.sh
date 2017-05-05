#!/bin/bash

kubectl run distributed-objects-app-deployment --image=gigapotential/distributed-objects-app:v0 --port=80 -l visualize=true,name=CSE775
