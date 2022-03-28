#!/usr/bin/env bash
docker build -t flask-app-image -f flask-app-image.dockerfile .
kubectl apply -f ./secret.yaml
kubectl create -f ./configmap.yaml
kubectl create -f ./services.yaml
kubectl create -f ./deployments.yaml

# kubectl exec -it <pod-name> -- /bin/bash -c "python3 /app/records.py" 