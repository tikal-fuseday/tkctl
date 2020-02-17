
output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = module.azurerm_network.vnet_name
}

output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = module.azurerm_network.vnet_id
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = module.azurerm_network.vnet_location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = module.azurerm_network.vnet_address_space
}

output "vnet_subnets" {
  description = "The ids of subnets created inside the newl vNet"
  value       = module.azurerm_network.vnet_subnets
}



output "aks_id" {
  value = module.aks.aks_id
}

output "client_certificate" {
  value = module.aks.client_certificate
}

output "client_key" {
  value = module.aks.client_key
}

output "cluster_ca_certificate" {
  value = module.aks.cluster_ca_certificate
}

output "host" {
  value = module.aks.host
}

output "location" {
  value = module.aks.location
}

output "node_resource_group" {
  value = module.aks.node_resource_group
}

output "username" {
  value = module.aks.username
}

output "password" {
  value = module.aks.password
}

