#!/bin/bash

az stack group delete \
  --name voting-app-stack \
  --resource-group rg-docker-voting-app \
  --action-on-unmanage deleteResources \
  --yes