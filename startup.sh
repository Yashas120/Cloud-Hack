sudo echo -e "\033[1;36mStartup Sequence Initiated\033[0m"
eval $(minikube docker-env)
docker build -t flask-app-image -f flask-app-image.dockerfile . 
kubectl apply -f secret.yaml
kubectl apply -f configmap.yaml
kubectl apply -f services.yaml 
nohup minikube tunnel -c & 
kubectl apply -f deployments.yaml
echo -e  "\033[32mLaunch Completed\033[0m" 
sleep 2s
while [ true ] ; do
val=$(kubectl get all)
printf "%s \n\033[44mPress any key after all the pods are deployed\033[0m\n" "$val"
read -t 3 -n 1
if [ $? = 0 ] ; then
kubectl get pods --selector=app=flaskapi -o name | head -n 1 | xargs -I{} kubectl exec {} -- /bin/bash -c "python3 /app/records.py"
echo -e  "\033[32mPosts inserted\033[0m" 
exit;

else
clear
fi
done
echo -e  "\033[31mPosts not inserted\033[0m" 
# sleep 20s
# kubectl exec -it <pod-name> -- /bin/bash -c "python3 /app/records.py" 