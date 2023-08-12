resource "azurerm_resource_group" "terraform-resource" {
  name     = ""
  location = ""
  tags = ""
}

resource "azurerm_storage_account" "terraform_storage_account" {
  name                     = ""
  resource_group_name      = ""
  location                 = ""
  account_tier             = ""
  account_replication_type = ""

  tags = ""
}

resource "azurerm_storage_container" "terraform_storage_container" {
  name                  = ""
  storage_account_name  = ""
}