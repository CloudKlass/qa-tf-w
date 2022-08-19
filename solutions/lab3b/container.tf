resource "azurerm_storage_container" "lab3bcontainer" {
  name                  = "l3container"
  storage_account_name  = azurerm_storage_account.lab3bsa.name
  container_access_type = "blob"
}