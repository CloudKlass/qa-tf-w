
resource "azurerm_virtual_network" "lab3" {
  name                = "lab3-vNet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.lab3.location
  resource_group_name = azurerm_resource_group.lab3.name
}


resource "azurerm_subnet" "lab3" {
  name                 = "lab3subnet"
  resource_group_name  = azurerm_resource_group.lab3.name
  virtual_network_name = azurerm_virtual_network.lab3.name
  address_prefixes      = ["10.1.1.0/24"]
}
