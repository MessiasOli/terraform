resource "azurerm_resource_group" "resource-group" {
  name     = "time-sleep"
  location = var.location
  tags     = local.commun_tags
}

resource "time_sleep" "wait_10_seconds" {
  depends_on = [azurerm_resource_group.resource-group]

  create_duration = "10s"
}

resource "azurerm_virtual_network" "vnet" {
  depends_on = [time_sleep.wait_10_seconds]

  name                = "vnet-terraform-time-sleep"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource-group.name
  address_space       = ["10.0.0.0/16"]

  tags = local.commun_tags
}