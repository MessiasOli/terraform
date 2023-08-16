
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
    key                  = "azure-vm-provisioners/terraform.tfstate"
  }
}


provider "azurerm" {
  skip_provider_registration = true
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "storage_account_resource_group"
    storage_account_name = "messiasstorageaccount"
    container_name       = "imagens"
    key                  = "azure-vnet/terraform.tfstate"
  }
}
