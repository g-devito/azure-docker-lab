param vnetId string

resource DNSVotingApp 'Microsoft.Network/privateDnsZones@2024-06-01' = {
  location: 'global'
  name: 'voter.postgres.database.azure.com'
  properties: {}
}

resource LinksVotingApp 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01' = {
  parent: DNSVotingApp
  location: 'global'
  name: 'LinksVotingApp'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnetId
    }
  }
}

output dnsZoneId string = DNSVotingApp.id
