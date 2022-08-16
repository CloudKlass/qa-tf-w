
output "host" {
    value = module.aks.host
    sensitive = true
}

output "client_certificate" {
    value = base64decode(module.aks.client_certificate)
    sensitive = true
}

output "client_key" {
    value = base64decode(module.aks.client_key)
    sensitive = true
}

 output "cluster_ca_certificate" {
    value = base64decode(module.aks.cluster_ca_certificate)
    sensitive = true
} 
  