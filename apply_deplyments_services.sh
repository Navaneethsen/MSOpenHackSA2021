#/bin/bash

# az login --use-device-code

# az aks get-credentials --resource-group MsOpenHack2021v1 --name tripViewer

# az aks update --name tripViewer --resource-group MsOpenHack2021v1 --attach-acr registrysiq8419

# az aks check-acr --name tripViewer --resource-group MsOpenHack2021v1 --acr registrysiq8419


kubectl apply -f scripts/challenge-3/poi-deployment.yaml
kubectl apply -f scripts/challenge-3/trips-deployment.yaml
kubectl apply -f scripts/challenge-3/tripviewer-deployment.yaml
kubectl apply -f scripts/challenge-3/user-deployment.yaml
kubectl apply -f scripts/challenge-3/userprofile-deployment.yaml

kubectl apply -f scripts/challenge-3/poi-service.yaml
kubectl apply -f scripts/challenge-3/trips-service.yaml
kubectl apply -f scripts/challenge-3/user-service.yaml
kubectl apply -f scripts/challenge-3/userprofile-service.yaml
kubectl apply -f scripts/challenge-3/tripviewer-service.yaml

kubectl apply -f scripts/challenge-3/sql-secret.yaml --namespace web
kubectl apply -f scripts/challenge-3/sql-secret.yaml --namespace api

echo "\n -- Deployments -- "
kubectl get deployment --namespace=web
kubectl get deployment --namespace=api

echo "\n -- Services -- "
kubectl get service --namespace=web
kubectl get service --namespace=api

echo "\n -- Pods -- "
kubectl get pods --namespace=web
kubectl get pods --namespace=api

echo "\n -- Secrets -- "
kubectl get secrets --namespace=web
kubectl get secrets --namespace=api


# kubectl exec -it userprofile-5bdd956c86-s4vmj -- /bin/sh
# kubectl create namespace web
# kubectl create namespace api
