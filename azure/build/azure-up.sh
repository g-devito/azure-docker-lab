#!/bin/bash
RG_NAME="rg-docker-voting-app"
NAME="voting-app-stack"

az stack group create --name $NAME --resource-group $RG_NAME --template-file ../main.bicep --parameters ../main.bicepparam --action-on-unmanage deleteResources --deny-settings-mode none --yes