
output "host" {
    value = module.aks.host
}

output "client_certificate" {
    value = base64decode(module.aks.client_certificate)
}

output "client_key" {
    value = base64decode(module.aks.client_key)
}

 output "cluster_ca_certificate" {
    value = base64decode(module.aks.cluster_ca_certificate)
} 
  