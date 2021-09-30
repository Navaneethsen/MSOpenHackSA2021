#/bin/bash

# az login --use-device-code

# az aks get-credentials --resource-group MsOpenHack2021v1 --name tripViewer

# az aks update --name tripViewer --resource-group MsOpenHack2021v1 --attach-acr registrysiq8419

# az aks check-acr --name tripViewer --resource-group MsOpenHack2021v1 --acr registrysiq8419


kubectl apply -f scripts/challenge-4/poi-deployment.yaml
kubectl apply -f scripts/challenge-4/trips-deployment.yaml
kubectl apply -f scripts/challenge-4/tripviewer-deployment.yaml
kubectl apply -f scripts/challenge-4/user-deployment.yaml
kubectl apply -f scripts/challenge-4/userprofile-deployment.yaml

kubectl apply -f scripts/challenge-4/poi-service.yaml
kubectl apply -f scripts/challenge-4/trips-service.yaml
kubectl apply -f scripts/challenge-4/user-service.yaml
kubectl apply -f scripts/challenge-4/userprofile-service.yaml
kubectl apply -f scripts/challenge-4/tripviewer-service.yaml

kubectl apply -f scripts/challenge-4/sql-secret.yaml --namespace web
kubectl apply -f scripts/challenge-4/sql-secret.yaml --namespace api

kubectl apply -f scripts/challenge-4/api-dev-role.yaml
kubectl apply -f scripts/challenge-4/api-dev-rolebinding.yaml

kubectl apply -f scripts/challenge-4/web-dev-role.yaml
kubectl apply -f scripts/challenge-4/web-dev-rolebinding.yaml

echo "\n -- Deployments -- "
kubectl get deployment --all-namespaces=true

echo "\n -- Services -- "
kubectl get service --all-namespaces=true

echo "\n -- Pods -- "
kubectl get pods --all-namespaces=true

echo "\n -- Secrets -- "
kubectl get secrets --all-namespaces=true

echo "\n -- Roles -- "
kubectl get roles --all-namespaces=true

echo "\n -- RoleBindings -- "
kubectl get rolebinding --all-namespaces=true

# kubectl exec -it userprofile-5bdd956c86-s4vmj -- /bin/sh
# kubectl create namespace web
# kubectl create namespace api

# kubectl get pods -n api

# easiest way to creat rles and role bindings
# kubectl create rolebinding api-view --clusterrole=view --user=webdev@OTAPRD1486ops.onmicrosoft.com --namespace=api
# kubectl create rolebinding api-edit --clusterrole=edit --user=apidev@OTAPRD1486ops.onmicrosoft.com --namespace=api

# kubectl create rolebinding web-view --clusterrole=view --user=apidev@OTAPRD1486ops.onmicrosoft.com --namespace=web
# kubectl create rolebinding web-edit --clusterrole=edit --user=webdev@OTAPRD1486ops.onmicrosoft.com --namespace=web


# https://www.youtube.com/watch?v=a_sQuL2mOAY
# https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles