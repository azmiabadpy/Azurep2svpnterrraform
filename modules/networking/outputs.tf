
output "vnet_a_id" {
  description = "VNet A resource ID"
  value       = azurerm_virtual_network.vnet_a.id
}

output "vnet_a_name" {
  description = "VNet A name"
  value       = azurerm_virtual_network.vnet_a.name
}

output "vnet_b_id" {
  description = "VNet B resource ID"
  value       = azurerm_virtual_network.vnet_b.id
}

output "vnet_b_name" {
  description = "VNet B name"
  value       = azurerm_virtual_network.vnet_b.name
}

output "private_endpoint_subnet_id" {
  description = "Private endpoint subnet ID"
  value       = azurerm_subnet.private_endpoint.id
}

output "dns_resolver_subnet_id" {
  description = "DNS resolver subnet ID"
  value       = azurerm_subnet.dns_resolver.id
}

output "gateway_subnet_id" {
  description = "VPN Gateway subnet ID"
  value       = azurerm_subnet.gateway.id
}
