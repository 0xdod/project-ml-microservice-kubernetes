#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=0xdod/prediction

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment hello-prediction --image=${dockerpath}

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment hello-prediction --type=NodePort --port=80
