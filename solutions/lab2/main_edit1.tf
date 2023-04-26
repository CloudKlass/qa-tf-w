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
  name     = "RG2"
  location = "West Europe"
}

resource "azurerm_virtual_network" "lab2" {
  name                = "lab2-vNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.lab2.location
  resource_group_name = azurerm_resource_group.lab2.name
}


resource "azurerm_subnet" "lab2" {
  name                 = "lab2subnet"
  resource_group_name  = azurerm_resource_group.lab2.name
  virtual_network_name = azurerm_virtual_network.lab2.name
  address_prefixes      = ["10.0.1.0/24"]
}

  


# Do not edit above this line - The above code has been provided so that you may concentrate on building a VM and not be concerned with Provider, Resource Group or VNET at this time

resource "azurerm_network_interface" "lab2" {
  name                = "lab2-nic"
  location            = azurerm_resource_group.lab2.location
  resource_group_name = azurerm_resource_group.lab2.name

  ip_configuration {
    name                          = "lab2_ip"
    subnet_id                     = azurerm_subnet.lab2.id
    private_ip_address_allocation = "Dynamic"
  }
}



resource "azurerm_windows_virtual_machine" "lab2" {
  name                = "VM2"
  resource_group_name = azurerm_resource_group.lab2.name
  location            = azurerm_resource_group.lab2.location
  size                = "Standard_B2S"
  admin_username      = "TFadminuser"
  admin_password      = "TF_P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.lab2.id,
  ]
 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
