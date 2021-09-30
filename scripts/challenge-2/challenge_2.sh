#/bin/bash

# run 
docker pull mcr.microsoft.com/mssql/server:2017-latest

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Passw0rd" -p 1433:1433 --name sqlserver-2017 -h sqlserver-2017 -d mcr.microsoft.com/mssql/server:2017-latest

# important 
# https://docs.docker.com/network/bridge/
docker network create sql-network
docker network connect sql-network sqlserver-2017

docker run --network sql-network -e SQLFQDN=sqlserver-2017 -e SQLUSER=SA -e SQLPASS=Passw0rd -e SQLDB=mydrivingDB openhack/data-load:v1

cp ../dockerfiles/Dockerfile_3 Dockerfile.POI

# update the ENV variables as 



# docker build -f ./scripts/Dockerfile.POI -t "tripinsights/poi:1.0" src/poi
# docker run -d -p 8080:80 --name poi tripinsights/poi:1.0 .

# docker build -f ../../scripts/Dockerfile.UserProfile -t "tripinsights/user-java:1.0" .
# docker build -f ../../scripts/Dockerfile.UserProfile -t "tripinsights/userprofile:1.0" .
# docker build -f ../../scripts/Dockerfile.Trips -t "tripinsights/trips:1.0" .
# docker build -f ../../scripts/Dockerfile.TripViewer -t "tripinsights/tripviewer:1.0" .


az acr build --image tripinsights/poi:1.0 --registry registrysiq8419 --file scripts/Dockerfile.POI src/poi
az acr build --image tripinsights/trips:1.0 --registry registrysiq8419 --file scripts/Dockerfile.Trips src/trips
az acr build --image tripinsights/tripviewer:1.0 --registry registrysiq8419 --file scripts/Dockerfile.TripViewer src/tripviewer
az acr build --image tripinsights/user-java:1.0 --registry registrysiq8419 --file scripts/Dockerfile.User src/user-java
az acr build --image tripinsights/userprofile:1.0 --registry registrysiq8419 --file scripts/Dockerfile.UserProfile src/userprofile