param location string
param vnetName string
param addressSpace string
param subnetPrefixes object
param tags object = {}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressSpace
      ]
    }
    subnets: [
      {
        name: 'AzureFirewallSubnet'
        properties: {
          addressPrefix: subnetPrefixes.AzureFirewallSubnet
        }
      }
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: subnetPrefixes.AzureBastionSubnet
        }
      }
      {
        name: 'shared-services'
        properties: {
          addressPrefix: subnetPrefixes.sharedServices
        }
      }
      {
        name: 'private-endpoints'
        properties: {
          addressPrefix: subnetPrefixes.privateEndpoints
          privateEndpointNetworkPolicies: 'Disabled'
        }
      }
    ]
  }
}

output virtualNetworkId string = virtualNetwork.id
