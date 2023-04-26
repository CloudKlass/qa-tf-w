

resource "azurerm_network_security_group" "lab3nsg" {
  name                = "lab3SecurityGroup"
  location            = azurerm_resource_group.lab3.location
  resource_group_name = azurerm_resource_group.lab3.name

  security_rule {
    name                       = "WebAdminNSG"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_ranges          = ["0-65535"]
    destination_port_ranges     = ["3389"]
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "nsgAssoc" {
  subnet_id                 = azurerm_subnet.lab3.id
  network_security_group_id = azurerm_network_security_group.lab3nsg.id
}
