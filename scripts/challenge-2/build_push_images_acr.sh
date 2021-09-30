#/bin/bash
#root directory of your project

az acr build --image tripinsights/poi:1.0 --registry registrysiq8419 --file scripts/Dockerfile.POI src/poi
az acr build --image tripinsights/trips:1.0 --registry registrysiq8419 --file scripts/Dockerfile.Trips src/trips
az acr build --image tripinsights/tripviewer:1.0 --registry registrysiq8419 --file scripts/Dockerfile.TripViewer src/tripviewer
az acr build --image tripinsights/user-java:1.0 --registry registrysiq8419 --file scripts/Dockerfile.User src/user-java
az acr build --image tripinsights/userprofile:1.0 --registry registrysiq8419 --file scripts/Dockerfile.UserProfile src/userprofile