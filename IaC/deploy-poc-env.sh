RESOURCE_GROUP="Containers_Zone"
LOCATION="eastus2"
CONTAINERAPPS_ENVIRONMENT="oa-poc-env"

CONTAINER_IMAGE_NAME=$4
REGISTRY_SERVER=$5
REGISTRY_USERNAME=$6
REGISTRY_PASSWORD=$7

az login --service-principal -u $1 -p $2 --tenant $3

az extension add --name containerapp --upgrade
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights

az containerapp env create --name $CONTAINERAPPS_ENVIRONMENT --resource-group $RESOURCE_GROUP --location $LOCATION

az containerapp create --name my-container-app --resource-group $RESOURCE_GROUP --image $CONTAINER_IMAGE_NAME --environment $CONTAINERAPPS_ENVIRONMENT --registry-server $REGISTRY_SERVER --registry-username $REGISTRY_USERNAME --registry-password $REGISTRY_PASSWORD