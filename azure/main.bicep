resource VNetVotingApp 'Microsoft.Network/virtualNetworks@2025-05-01' = {
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
        }
      }
    ]
  }
}

