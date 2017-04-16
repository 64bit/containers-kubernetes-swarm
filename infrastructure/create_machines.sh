#!/bin/bash

#  ## Docker Machine supported Drivers:
#  Amazon Web Services
#  Microsoft Azure
#  Digital Ocean
#  Exoscale
#  Google Compute Engine
#  Generic
#  Microsoft Hyper-V
#  OpenStack
#  Rackspace
#  IBM Softlayer
#  Oracle VirtualBox
#  VMware vCloud Air
#  VMware Fusion
#  VMware vSphere

# Define the number of managers/workers
source ./config.cfg

# Create the Docker hosts: Swarm Manager + Swarm Worker Nodes

# Create Swarm Manager Nodes
for i in $(seq 1 $MANAGER); 
do 
  docker-machine create --driver virtualbox manager$i; 
done

# Create Swarm Worker Nodes
for i in $(seq 1 $WORKER); 
do 
  docker-machine create --driver virtualbox worker$i;
done

