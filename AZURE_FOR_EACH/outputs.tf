output "location-resource-group-US" {
  value = azurerm_resource_group.resource-group["EUA"].location
}

output "location-resource-group-EUROPA" {
  value = azurerm_resource_group.resource-group["EUROPA"].location
}

output "location-resource-group-ASIA" {
  value = azurerm_resource_group.resource-group["ASIA"].location
}