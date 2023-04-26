terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.18.0"
    }
    random = {
      source  = "hashicorp/random" # Path to Docs: https://registry.terraform.io/providers/hashicorp/random/latest/docs
      version = "~> 3.3.2"
    }
    archive = {
      source  = "hashicorp/archive" # Path to Docs: https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/archive_file
      version = "~> 2.2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "lab5" {
  name     = "RG5"
  location = "West Europe"
}

resource "random_id" "lab5saname" {  
  byte_length = 8
 }


resource "azurerm_storage_account" "lab5sa" {
  name                     = "lab5${lower(random_id.lab5saname.hex)}"
  resource_group_name      = azurerm_resource_group.lab5.name
  location                 = azurerm_resource_group.lab5.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 }
