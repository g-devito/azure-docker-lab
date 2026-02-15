resource VNetVotingApp 'Microsoft.Network/virtualNetworks@2024-07-01' = {
  name: 'VNetVotingApp'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-VM'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'Subnet-DB'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations:[
            {
              name: 'delegation'
              properties: {
                serviceName: 'Microsoft.DBforPostgreSQL/flexibleServers'
              }
            }
          ]
        }
      }
    ]
  }
}

resource DNSVotingApp 'Microsoft.Network/privateDnsZones@2024-06-01' = {
  location: 'global'
  name: 'privatelink.postgres.database.azure.com'
  properties: {}
}

resource LinksVotingApp 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01' = {
  parent: DNSVotingApp
  location: 'global'
  name: 'LinksVotingApp'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: VNetVotingApp.id
    }
  }
}
