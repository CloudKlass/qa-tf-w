
resource "random_id" "prefix" {
  byte_length = 8
}
resource "azurerm_resource_group" "lab6" {
  location = var.location
  name     = "${random_id.prefix.hex}-rg"
}

resource "azurerm_virtual_network" "lab6T" {
  name                = "${random_id.prefix.hex}-vn"
  resource_group_name = azurerm_resource_group.lab6.name
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.lab6.location
}

resource "azurerm_subnet" "lab6T" {
  name                 = "${random_id.prefix.hex}-sn"
  resource_group_name  = azurerm_resource_group.lab6.name
  virtual_network_name = azurerm_virtual_network.lab6T.name
  address_prefixes     = ["10.10.0.0/24"]
}

resource "azurerm_user_assigned_identity" "lab6T" {
  name                = "${random_id.prefix.hex}-identity"
  resource_group_name = azurerm_resource_group.lab6.name
  location            = azurerm_resource_group.lab6.location
}

module "aks" {
   source  = "Azure/aks/azurerm"
  version = "5.0.0"

  prefix                    = "prefix-${random_id.prefix.hex}"
  resource_group_name       = azurerm_resource_group.lab6.name
  agents_availability_zones = ["1", "2"]
  agents_count              = null
  agents_labels = {
    "node1" : "label1"
  }
  agents_max_count = 2
  agents_max_pods  = 100
  agents_min_count = 1
  agents_pool_name = "lab6nodes"
  agents_tags = {
    "Agent" : "agentTag"
  }
  agents_type                             = "VirtualMachineScaleSets"
  azure_policy_enabled                    = true
  client_id                               = var.client_id
  client_secret                           = var.client_secret
  enable_auto_scaling                     = true
  enable_host_encryption                  = false
  http_application_routing_enabled        = true
  ingress_application_gateway_enabled     = true
  log_analytics_workspace_enabled         = true
  role_based_access_control_enabled       = true
  ingress_application_gateway_name        = "${random_id.prefix.hex}-agw"
  ingress_application_gateway_subnet_cidr = "10.10.1.0/24"
  local_account_disabled                  = true
  net_profile_dns_service_ip              = "10.0.0.10"
  net_profile_docker_bridge_cidr          = "170.10.0.1/16"
  net_profile_service_cidr                = "10.0.0.0/16"
  network_plugin                          = "azure"
  network_policy                          = "azure"
  os_disk_size_gb                         = 60
  private_cluster_enabled                 = false #This is only being disabled due to the lab. This exposes the cluster API public. SHOULD create a VM in VNET and access from there with kubectl commands
  rbac_aad_managed                        = true
  sku_tier                                = "Paid"
  vnet_subnet_id                          = azurerm_subnet.lab6T.id

  depends_on = [azurerm_resource_group.lab6]
}
