terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
 
    random = {
      source = "hashicorp/random"
      version = "3.3.2"
    }
  }

  }
  cloud {
    organization = "QATIP-Azure"
    workspaces {
      name = "lab6-azure"
    }
  }

provider "azurerm" {
  features {}
}

provider "random" {

}