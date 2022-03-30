sudo eval $(minikube docker-env)
docker build -t flask-app-image -f flask-app-image.dockerfile . 
kubectl apply -f secret.yaml
kubectl apply -f configmap.yaml
kubectl apply -f services.yaml 
nohup minikube tunnel -c & 
kubectl apply -f deployments.yaml
echo -e  "\033[32mStartup Completed\033[0m" 
sleep 2s
# tput sc
while [ true ] ; do
# tput rc
kubectl get all
echo -e "\033[44mPress any key after all the pods are deployed\033[0m"
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
clear
fi
done
# sleep 20s
# kubectl exec -it <pod-name> -- /bin/bash -c "python3 /app/records.py" 
# kubectl get pods --selector=app=flaskapi -o name | head -n 1 | xargs -I{} kubectl exec {} -- /bin/bash -c "python3 /app/records.py"