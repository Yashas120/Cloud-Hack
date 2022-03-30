#!/usr/bin/env bash
docker build -t flask-app-image -f flask-app-image.dockerfile .
kubectl apply -f ./secret.yaml
kubectl create -f ./configmap.yaml
kubectl create -f ./services.yaml
kubectl create -f ./deployments.yaml
echo -e  "\033[96mStartup Complete\033[0m" 

# kubectl exec -it <pod-name> -- /bin/bash -c "python3 /app/records.py" 
# kubectl get pods --selector=app=flaskapi -o name | xargs -I{} kubectl exec {} -- /bin/bash -c "python3 /app/records.py"

# kubectl get pods --selector=app=flaskapi -o name | head -n 1 | xargs -I{} kubectl exec {} -- /bin/bash -c "python3 /app/records.py"