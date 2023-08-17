resource "azurerm_resource_group" "resource-group" {
  for_each = {
    "EUA"    = "East US"
    "EUROPA" = "West EUROPE"
    "ASIA"   = "Japan East"
  }

  name     = each.key
  location = each.value
  tags     = local.commun_tags
}