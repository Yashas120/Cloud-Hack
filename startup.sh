eval $(minikube docker-env)
docker build -t flask-app-image -f flask-app-image.dockerfile . 
kubectl apply -f secret.yaml
kubectl apply -f configmap.yaml
kubectl apply -f services.yaml 
kubectl apply -f deployments.yaml
nohup minikube tunnel -c &