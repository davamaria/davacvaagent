using '../main.bicep'

param workloadName = 'dava-cva'
param environment = 'prod'
param location = 'uksouth'
param hubAddressSpace = '10.30.0.0/16'
param hubSubnetPrefixes = {
  AzureFirewallSubnet: '10.30.0.0/24'
  AzureBastionSubnet: '10.30.1.0/26'
  sharedServices: '10.30.2.0/24'
  privateEndpoints: '10.30.3.0/24'
}
param allowedIpCidrs = [
  '203.0.113.10/32'
]
param logRetentionInDays = 90
param tags = {
  environment: 'prod'
  workload: 'dava-cva'
  owner: 'cloud-platform'
  costCenter: 'shared-platform'
  businessCriticality: 'high'
  managedBy: 'bicep'
  repository: 'dava-cva-agent'
}
