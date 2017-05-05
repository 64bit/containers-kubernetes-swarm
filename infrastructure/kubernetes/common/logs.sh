#!/bin/bash

POD_NAME=$1
kubectl logs $POD_NAME
