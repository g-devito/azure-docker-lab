module VNetVotingApp 'modules/vnet.bicep' = {
  name: 'VNetVotingApp'
}

module DnsVotingApp 'modules/dns.bicep' = {
  name: 'DnsVotingApp'
  params: {
    vnetId: VNetVotingApp.outputs.vnetId
  }
}

