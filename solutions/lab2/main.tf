terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.18.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "lab2" {
  name     = "RG-Lab2"
  location = "West Europe"
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.lab2.name
  address_space       = ["10.1.0.0/16"]
  subnet_prefixes     = ["10.1.1.0/24"]
  subnet_names        = ["lab2-subnet"]

  tags = {
    environment = "lab2"
    }

  depends_on = [azurerm_resource_group.lab2]
}

# Do not edit above this line - The above code has been provided so that you may concentrate on building a VM and not be concerned with Provider, Resource Group or VNET at this time

