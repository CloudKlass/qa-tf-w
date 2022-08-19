resource "azurerm_storage_account" "lab3bsa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.lab3b.name
  location                 = azurerm_resource_group.lab3b.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
# add the code between these two comment blocks ##########

static_website {
    index_document = "index.html"
  }
# end of comment block ###################################
 }


# applying the above code will turn on Static Hosting, set the default document to index.html AND create a $web container to place web content
# When uploading via IaC we need to pass the name of the container for the html file. We have declared a 'local' variable to hold the $web container name

locals {containername = "$web"} 

# create a sections for the the index.html upload

resource "azurerm_storage_blob" "indexupload" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.lab3bsa.name
  storage_container_name = local.containername
  type                   = "Block"
  content_type           = "text/html" # ensure you set content type: it will default to "application/octet-stream" and we require "text/html"
  source                 = "./index.html"

}