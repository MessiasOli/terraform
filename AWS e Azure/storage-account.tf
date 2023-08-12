resource "azurerm_resource_group" "terraform-resource" {
  name     = "remote-state"
  location = var.location
  tags     = local.commun_tags
}

resource "azurerm_storage_account" "terraform_storage_account" {
  name                     = "messiasremotestate"
  resource_group_name      = azurerm_resource_group.terraform-resource.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  blob_properties {
    versioning_enabled = true
  }

  tags = local.commun_tags
}

resource "azurerm_storage_container" "terraform_storage_container" {
  name                 = "remote-state"
  storage_account_name = azurerm_storage_account.terraform_storage_account.name
}