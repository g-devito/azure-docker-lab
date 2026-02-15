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
output vnetId string = VNetVotingApp.id
output dbSubnetId string = VNetVotingApp.properties.subnets[1].id
