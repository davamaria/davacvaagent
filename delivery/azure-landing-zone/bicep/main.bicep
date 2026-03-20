targetScope = 'subscription'

@description('Short workload or platform identifier used in names.')
param workloadName string = 'dava-cva'

@description('Deployment environment, for example dev, test, or prod.')
@allowed([
  'dev'
  'test'
  'prod'
])
param environment string

@description('Primary Azure region for the landing zone.')
param location string = deployment().location

@description('Address space assigned to the hub virtual network.')
param hubAddressSpace string = '10.20.0.0/16'

@description('Subnet prefixes for the hub virtual network.')
param hubSubnetPrefixes object = {
  AzureFirewallSubnet: '10.20.0.0/24'
  AzureBastionSubnet: '10.20.1.0/26'
  sharedServices: '10.20.2.0/24'
  privateEndpoints: '10.20.3.0/24'
}

@description('Optional trusted public CIDR ranges for administrative access to platform services.')
param allowedIpCidrs array = []

@description('Log Analytics retention in days.')
param logRetentionInDays int = 30

@description('Tags applied to all resources.')
param tags object = {
  environment: environment
  workload: workloadName
  managedBy: 'bicep'
  repository: 'dava-cva-agent'
}

@description('Private DNS zones commonly required for private-link enabled platform services.')
param privateDnsZones array = [
  'privatelink.blob.core.windows.net'
  'privatelink.file.core.windows.net'
  'privatelink.vaultcore.azure.net'
  'privatelink.database.windows.net'
  'privatelink.azurewebsites.net'
]

var normalizedLocation = toLower(replace(location, ' ', ''))
var namePrefix = '${workloadName}-${environment}-${normalizedLocation}'
var resourceGroups = {
  connectivity: 'rg-${namePrefix}-connectivity'
  management: 'rg-${namePrefix}-management'
  security: 'rg-${namePrefix}-security'
}

module resourceGroupsModule './modules/resource-groups.bicep' = {
  name: 'resource-groups'
  params: {
    location: location
    resourceGroupNames: [
      resourceGroups.connectivity
      resourceGroups.management
      resourceGroups.security
    ]
    tags: tags
  }
}

resource connectivityRg 'Microsoft.Resources/resourceGroups@2024-03-01' existing = {
  name: resourceGroups.connectivity
}

resource managementRg 'Microsoft.Resources/resourceGroups@2024-03-01' existing = {
  name: resourceGroups.management
}

resource securityRg 'Microsoft.Resources/resourceGroups@2024-03-01' existing = {
  name: resourceGroups.security
}

module hubNetwork './modules/hub-network.bicep' = {
  name: 'hub-network'
  scope: connectivityRg
  dependsOn: [
    resourceGroupsModule
  ]
  params: {
    location: location
    tags: tags
    vnetName: 'vnet-${namePrefix}-hub'
    addressSpace: hubAddressSpace
    subnetPrefixes: hubSubnetPrefixes
  }
}

module observability './modules/observability.bicep' = {
  name: 'observability'
  scope: managementRg
  dependsOn: [
    resourceGroupsModule
  ]
  params: {
    location: location
    tags: tags
    workspaceName: 'log-${namePrefix}'
    applicationInsightsName: 'appi-${namePrefix}'
    retentionInDays: logRetentionInDays
  }
}

module securityBaseline './modules/security-baseline.bicep' = {
  name: 'security-baseline'
  scope: securityRg
  dependsOn: [
    resourceGroupsModule
  ]
  params: {
    location: location
    tags: tags
    tenantId: subscription().tenantId
    keyVaultName: take(toLower(replace('kv-${namePrefix}', '-', '')), 24)
    recoveryVaultName: 'rsv-${namePrefix}'
    allowedIpCidrs: allowedIpCidrs
  }
}

module privateDns './modules/private-dns.bicep' = {
  name: 'private-dns'
  scope: connectivityRg
  dependsOn: [
    resourceGroupsModule
  ]
  params: {
    tags: tags
    zoneNames: privateDnsZones
  }
}

output connectivityResourceGroupName string = resourceGroups.connectivity
output managementResourceGroupName string = resourceGroups.management
output securityResourceGroupName string = resourceGroups.security
output hubVirtualNetworkId string = hubNetwork.outputs.virtualNetworkId
output logAnalyticsWorkspaceId string = observability.outputs.logAnalyticsWorkspaceId
output keyVaultId string = securityBaseline.outputs.keyVaultId
