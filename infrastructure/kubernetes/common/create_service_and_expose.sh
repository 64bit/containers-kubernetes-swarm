#!/bin/bash

kubectl expose deployment/distributed-objects-app-deployment --type="NodePort" --port 80
