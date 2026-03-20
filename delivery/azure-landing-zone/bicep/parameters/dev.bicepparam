using '../main.bicep'

param workloadName = 'dava-cva'
param environment = 'dev'
param location = 'uksouth'
param hubAddressSpace = '10.20.0.0/16'
param hubSubnetPrefixes = {
  AzureFirewallSubnet: '10.20.0.0/24'
  AzureBastionSubnet: '10.20.1.0/26'
  sharedServices: '10.20.2.0/24'
  privateEndpoints: '10.20.3.0/24'
}
param allowedIpCidrs = [
  '203.0.113.10/32'
]
param logRetentionInDays = 30
param tags = {
  environment: 'dev'
  workload: 'dava-cva'
  owner: 'cloud-platform'
  costCenter: 'shared-platform'
  managedBy: 'bicep'
  repository: 'dava-cva-agent'
}
