RESOURCE_GROUP="Containers_Zone"
LOCATION="eastus2"
CONTAINERAPPS_ENVIRONMENT="oa-poc-env"

az login --service-principal -u $1 -p $2 --tenant $3

az extension add --name containerapp --upgrade
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights

az containerapp env create --name $CONTAINERAPPS_ENVIRONMENT --resource-group $RESOURCE_GROUP --location $LOCATION
