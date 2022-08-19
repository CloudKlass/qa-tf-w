resource "azurerm_storage_blob" "lab3upload" {
  name                   = "l3bUpload.pdf"
  storage_account_name   = azurerm_storage_account.lab3bsa.name
  storage_container_name = azurerm_storage_container.lab3bcontainer.name
  type                   = "Block"
  source                 = "./blob.pdf"
}