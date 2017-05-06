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
# access app on :  http://<external-IP>

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
# 2) Access app on : http://<virtual-machine-ip>:<node-port>

# Scale Up:
./infrastructure/kubernetes/common/scale_up.sh

# Scale Down:
./infrastructure/kubernetes/common/scale_down.sh

# Rolling update to v2 of app
./infrastructure/kubernetes/common/update_to_v2.sh

# Rollback to previous deployment
./infrastructure/kubernetes/common/rollback_update.sh

```



