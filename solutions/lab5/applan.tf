resource "azurerm_service_plan" "lab5svcp" {
  name                = "lab5serviceplan"
  resource_group_name = azurerm_resource_group.lab5.name
  location            = azurerm_resource_group.lab5.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_function_app" "lab5function" {
  name                       = "http-invoke"
  location                   = azurerm_resource_group.lab5.location
  resource_group_name        = azurerm_resource_group.lab5.name
  app_service_plan_id        = azurerm_service_plan.lab5svcp.id
  storage_account_name       = azurerm_storage_account.lab5sa.name
  storage_account_access_key = azurerm_storage_account.lab5sa.primary_access_key
  os_type                    = "linux"
  version                    = "~4"

  site_config {
    linux_fx_version = "python|3.9"
  }
}
