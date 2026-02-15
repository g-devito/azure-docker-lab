#!/bin/bash
RG_NAME="rg-docker-voting-app"
LOCATION="switzerlandnorth"
NAME="voting-app-stack"

az group create --name $RG_NAME --location $LOCATION

az stack group create --name $NAME --resource-group $RG_NAME --template-file ../main.bicep --parameters ../main.bicepparam --action-on-unmanage deleteResources --deny-settings-mode none --yes