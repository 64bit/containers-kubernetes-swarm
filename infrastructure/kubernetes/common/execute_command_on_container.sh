#!/bin/bash 
POD_NAME=$1

kubectl exec -ti $POD_NAME bash
