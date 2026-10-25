
output "dns_resolver_id" {
  description = "DNS Private Resolver resource ID"
  value       = azurerm_private_dns_resolver.main.id
}

output "inbound_endpoint_id" {
  description = "DNS resolver inbound endpoint resource ID"
  value       = azurerm_private_dns_resolver_inbound_endpoint.main.id
}

output "inbound_private_ip" {
  description = "DNS resolver inbound private IP"
  value       = var.inbound_private_ip
}
