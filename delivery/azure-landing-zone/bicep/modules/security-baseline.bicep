param location string
param tenantId string
param keyVaultName string
param recoveryVaultName string
param allowedIpCidrs array = []
param tags object = {}

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: keyVaultName
  location: location
  tags: tags
  properties: {
    tenantId: tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enableRbacAuthorization: true
    enablePurgeProtection: true
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    publicNetworkAccess: 'Enabled'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      ipRules: [for cidr in allowedIpCidrs: {
        value: cidr
      }]
    }
  }
}

resource recoveryVault 'Microsoft.RecoveryServices/vaults@2023-08-01' = {
  name: recoveryVaultName
  location: location
  tags: tags
  sku: {
    name: 'Standard'
  }
  properties: {}
}

output keyVaultId string = keyVault.id
output recoveryVaultId string = recoveryVault.id
