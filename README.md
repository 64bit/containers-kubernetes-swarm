# Prerequisites


* Docker (1.27)
* kubectl (1.6) 
* Virtualbox
* minikube (v0.18.0)
* gcloud (from google-cloud-sdk only required for GKE )


# Kubernetes

## Run app on Kubernetes cluster on GKE

```
# Start Cluster: 
# https://cloud.google.com/container-engine/

# Point kubectl to GKE Master API:
./infrastructure/kubernetes/GKE/configure_kubectl.sh

# Deploy app:
./infrastructure/kubernetes/common/deploy_app.sh

# Expose as Service:
./infrastructure/kubernetes/GKE/create_service_and_expose.sh
# After above command run "kubectl get service" to get external IP of load balancer
# access app on :  http://<external-IP>/hello

# Scale Up:
./infrastructure/kubernetes/common/scale_up.sh

# Scale Down:
./infrastructure/kubernetes/common/scale_down.sh

# Rolling update to v2 of app
./infrastructure/kubernetes/common/update_to_v2.sh

# Rollback to previous deployment
./infrastructure/kubernetes/common/rollback_update.sh

```

## Run app on Kubernetes cluster locally

```
# Start Cluster: 
minikube start

# Deploy app:
./infrastructure/kubernetes/common/deploy_app.sh

# Expose as Service:
./infrastructure/kubernetes/local/create_service_and_expose.sh
# After above command we need to find the port on which we can access app on VM
# 1) Get NodePort : ./infrastructure/kubernetes/common/get_node_port.sh
# 2) Access app on : http://<virtual-machine-ip>:<node-port>/hello

# Scale Up:
./infrastructure/kubernetes/common/scale_up.sh

# Scale Down:
./infrastructure/kubernetes/common/scale_down.sh

# Rolling update to v2 of app
./infrastructure/kubernetes/common/update_to_v2.sh

# Rollback to previous deployment
./infrastructure/kubernetes/common/rollback_update.sh

```
### Cleanup everything we started on Kubernetes
```
# delete deployment 
./infrastructure/kubernetes/common/delete_deployment.sh

# delete service
./infrastructure/kubernetes/common/delete_service.sh

```

# Swarm

## Run app on local Swarm Cluster

```
# Start Cluster of Machines
./infrastructure/swarm/create_machines.sh

# Create Swarm: Assign Master Node and join it from Worker Nodes:
./infrastructure/swarm/create_swarm.sh

# Run app as Service on Swarm cluster:
./infrastructure/swarm/create_service.sh

# Get any manager IP and access app:
# http://<manager-ip>:8080/hello 

# Run visualizer container (dockersamples/visualizer):
./infrastructure/swarm/visualizer.sh
# Access visualizer on http://<manager-ip>:9999

# Run cAdvisor on manager1 : 
./infrastructure/swarm/monitor.sh
# Acess monitor on http://<ip-of-manager1>:8888

# Scale service:
./infrastructure/swarm/scale_service.sh

# Downscale service:
./infrastructure/swarm/downscale_service.sh


```

### Cleanup everything we started on Swarm

```
# Remove app service:
./infrastructure/swarm/rm_service.sh

# Remove visualizer service: 
./infrastructure/swarm/rm_visualizer.sh

# Remove cAdvisor monitor:
./infrastructure/swarm/rm_monitor.sh

# Stop virtual machines:
./infrastructure/swarm/stop_machines.sh

```

