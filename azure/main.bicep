param dbAdminUsername string
@secure()
param dbAdminPassword string
param serverName string
param rgLocation string = resourceGroup().location

module vnet 'modules/vnet.bicep' = {
  name: 'vnet-deploy'
  params: {
    rgLocation: rgLocation
  }
}

module dns 'modules/dns.bicep' = {
  name: 'dns-deploy'
  params: {
    vnetId: vnet.outputs.vnetId
  }
}

module postgres 'modules/postgres.bicep' = {
  name: 'postgres-deploy'
  params: {
    rgLocation: rgLocation
    adminPassword: dbAdminPassword
    adminUsername: dbAdminUsername
    dnsZoneId: dns.outputs.dnsZoneId
    serverName: serverName
    subnetId: vnet.outputs.dbSubnetId
  }
}
