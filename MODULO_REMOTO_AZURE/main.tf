
resource "azurerm_resource_group" "resource-group" {
  name     = "modulo-remoto"
  location = var.location
  tags     = local.commun_tags
}

terraform {
  required_version = "> 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "storage_account_resource_group"
    storage_account_name = "messiasstorageaccount"
    container_name       = "imagens"
    key                  = "azure-vm-modulo-remoto/terraform.tfstate"
  }
}


provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "5.3.0"

  resource_group_name = azurerm_resource_group.resource-group.name
  use_for_each        = true
  tags = {
    environment = "develop"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.resource-group]
}