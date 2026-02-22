param rgLocation string
@secure()
param vmPwd string
param subnetId string
param vmName string
param sku string

resource networkInterface 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: '${vmName}-nic'
  location: rgLocation
  properties: {
    ipConfigurations: [
      {
        name: '${vmName}-subnet'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetId
          }
        }
      }
    ]
  }
}

resource rhelVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: vmName
  location: rgLocation
  properties: {
    hardwareProfile: {
      vmSize: sku
    }
    osProfile: {
      computerName: vmName
      adminUsername: '${vmName}-user'
      adminPassword: vmPwd
    }
    storageProfile: {
      imageReference: {
        publisher: 'RedHat'
        offer: 'RHEL'
        sku: '8-lvm-gen2'
        version: 'latest'
      }
      osDisk: {
        name: '${vmName}-osDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
        diskSizeGB: 64
        osType: 'Linux'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id
        }
      ]
    }
  }
}
