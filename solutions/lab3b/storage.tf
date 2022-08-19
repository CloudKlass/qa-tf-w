resource "azurerm_storage_account" "lab3bsa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.lab3b.name
  location                 = azurerm_resource_group.lab3b.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 }