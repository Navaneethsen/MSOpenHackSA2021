#/bin/bash

# az login --use-device-code

# az aks get-credentials --resource-group MsOpenHack2021v1 --name tripViewer


kubectl apply -f scripts/challenge-5/poi-deployment.yaml
kubectl apply -f scripts/challenge-5/trips-deployment.yaml
kubectl apply -f scripts/challenge-5/tripviewer-deployment.yaml
kubectl apply -f scripts/challenge-5/user-deployment.yaml
kubectl apply -f scripts/challenge-5/userprofile-deployment.yaml

kubectl apply -f scripts/challenge-5/poi-service.yaml
kubectl apply -f scripts/challenge-5/trips-service.yaml
kubectl apply -f scripts/challenge-5/user-service.yaml
kubectl apply -f scripts/challenge-5/userprofile-service.yaml
kubectl apply -f scripts/challenge-5/tripviewer-service.yaml

kubectl apply -f scripts/challenge-5/sql-secret-keyvault.yaml

kubectl apply -f scripts/challenge-5/api-dev-role.yaml
kubectl apply -f scripts/challenge-5/api-dev-rolebinding.yaml

kubectl apply -f scripts/challenge-5/web-dev-role.yaml
kubectl apply -f scripts/challenge-5/web-dev-rolebinding.yaml

kubectl apply -f scripts/challenge-5/api-ingress.yaml
kubectl apply -f scripts/challenge-5/web-ingress.yaml

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

echo "\n -- Ingress -- "
kubectl get ingress --all-namespaces=true

# az feature register --namespace "Microsoft.ContainerService" --name "AKS-AzureKeyVaultSecretsProvider"
# az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService/AKS-AzureKeyVaultSecretsProvider')].{Name:name,State:properties.state}"
# az provider register --namespace Microsoft.ContainerService

# az extension add --name aks-preview
# az aks enable-addons --addons azure-keyvault-secrets-provider --name tripViewer --resource-group MsOpenHack2021v1
# az aks update -g MsOpenHack2021v1 -n tripViewer --enable-secret-rotation

# kubectl get pods -n kube-system -l 'app in (secrets-store-csi-driver, secrets-store-provider-azure)'

# az keyvault secret set --vault-name openhack-key-vault -n username --value sqladminsIq8419
# az keyvault secret set --vault-name openhack-key-vault -n password --value fZ5ec0Sr1
# az keyvault secret set --vault-name openhack-key-vault -n servername --value sqlserversiq8419.database.windows.net
# az keyvault secret set --vault-name openhack-key-vault -n dbname --value mydrivingDB

# {
#   "aadProfile": {
#     "adminGroupObjectIDs": [
#       "7f6e4042-45ef-4231-aeee-ca8c917d7c9a"
#     ],
#     "clientAppId": null,
#     "enableAzureRbac": null,
#     "managed": true,
#     "serverAppId": null,
#     "serverAppSecret": null,
#     "tenantId": "5fd38e9f-c2f8-4c2e-b13b-9e86e6e82e0a"
#   },
#   "addonProfiles": {
#     "azureKeyvaultSecretsProvider": {
#       "config": {
#         "enableSecretRotation": "true"
#       },
#       "enabled": true,
#       "identity": {
#         "clientId": "14092f3d-b5a5-4622-80ff-8ccd1f1c7c72",
#         "objectId": "f525ccc7-3cbe-418c-9de2-087a5ac8d1b3",
#         "resourceId": "/subscriptions/75ed44c9-2edd-4634-8e0d-190fae05f642/resourcegroups/MC_MSOpenHack2021v1_tripViewer_northeurope/providers/Microsoft.ManagedIdentity/userAssignedIdentities/azurekeyvaultsecretsprovider-tripviewer"
#       }
#     },

# az keyvault set-policy -n openhack-key-vault --secret-permissions get --spn 14092f3d-b5a5-4622-80ff-8ccd1f1c7c72

# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm repo update
# helm install ingress-nginx ingress-nginx/ingress-nginx --create-namespace --namespace ingress-ns
# kubectl --namespace ingress-ns get services -o wide -w ingress-nginx-controller


# https://docs.microsoft.com/en-us/azure/aks/configure-kubenet

# https://stacksimplify.com/azure-aks/kubernetes-clusterrole-rolebinding-with-azure-aks/