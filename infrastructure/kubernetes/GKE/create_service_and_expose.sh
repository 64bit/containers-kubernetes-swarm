#!/bin/bash

kubectl expose deployment/distributed-objects-app-deployment --type="LoadBalancer" --port 80
