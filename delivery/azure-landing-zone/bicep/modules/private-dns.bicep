param zoneNames array
param tags object = {}

resource privateDnsZones 'Microsoft.Network/privateDnsZones@2020-06-01' = [for zoneName in zoneNames: {
  name: zoneName
  location: 'global'
  tags: tags
}]

output privateDnsZoneIds array = [for zone in privateDnsZones: zone.id]
