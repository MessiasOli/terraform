resource "azurerm_resource_group" "resource-group" {
  name     = "vnet"
  location = var.location
  tags     = local.commun_tags
}

resource "null_resource" "provisioner" {
  provisioner "local-exec" {
    command = "echo Resource Group ID: ${azurerm_resource_group.resource-group.id} >> resource-group-id.txt"
  }
}