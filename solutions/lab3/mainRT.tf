

resource "azurerm_route_table" "lab3rt" {
  name                          = "lab3-route-table"
  location                      = azurerm_resource_group.lab3.location
  resource_group_name           = azurerm_resource_group.lab3.name
  disable_bgp_route_propagation = false

  route {
    name           = "routelocal"
    address_prefix = "10.1.0.0/16"
    next_hop_type  = "VnetLocal"
  }

  route {
    name           = "routeinternet"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }
}
resource "azurerm_subnet_route_table_association" "lab3rta" {
  subnet_id      = azurerm_subnet.lab3.id
  route_table_id = azurerm_route_table.lab3rt.id
}


