targetScope = 'subscription'

param location string
param resourceGroupNames array
param tags object = {}

resource resourceGroups 'Microsoft.Resources/resourceGroups@2024-03-01' = [for name in resourceGroupNames: {
  name: name
  location: location
  tags: tags
}]

output createdResourceGroupNames array = [for group in resourceGroups: group.name]
