
output "gateway_id" {
  description = "VPN Gateway resource ID"
  value       = azurerm_virtual_network_gateway.main.id
}

output "gateway_name" {
  description = "VPN Gateway name"
  value       = azurerm_virtual_network_gateway.main.name
}

output "public_ip_address" {
  description = "Public IP address of the VPN Gateway"
  value       = azurerm_public_ip.vpn.ip_address
}

output "public_ip_id" {
  description = "Public IP resource ID"
  value       = azurerm_public_ip.vpn.id
}
