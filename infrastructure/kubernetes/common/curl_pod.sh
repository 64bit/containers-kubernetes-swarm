#!/bin/bash

POD_NAME=$1
curl http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/hello
