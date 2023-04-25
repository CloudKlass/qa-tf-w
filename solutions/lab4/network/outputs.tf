output "rg-name" {
  description = "Name of the RG"
  value       = azurerm_resource_group.resgrp.name 
}

output "rg-location" {
  description = "Location of the RG"
  value       = azurerm_resource_group.resgrp.location 
}

output "front-end" {
  description = "id of frontend"
  value       = azurerm_subnet.frontend.id
}

output "back-end" {
  description = "id of backend"
  value       = azurerm_subnet.backend.id
}

output "public-ip" {
  description = "public-ip"
  value       = azurerm_public_ip.pubip.id
}


