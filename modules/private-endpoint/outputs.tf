
output "private_endpoint_id" {
  description = "Private endpoint resource ID"
  value       = azurerm_private_endpoint.blob.id
}

output "private_endpoint_name" {
  description = "Private endpoint name"
  value       = azurerm_private_endpoint.blob.name
}

output "private_ip_address" {
  description = "Private IP address assigned to the endpoint"
  value       = azurerm_private_endpoint.blob.private_service_connection[0].private_ip_address
}
