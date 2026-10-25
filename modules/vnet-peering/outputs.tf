
output "a_to_b_peering_id" {
  description = "VNet A to VNet B peering resource ID"
  value       = azurerm_virtual_network_peering.a_to_b.id
}

output "b_to_a_peering_id" {
  description = "VNet B to VNet A peering resource ID"
  value       = azurerm_virtual_network_peering.b_to_a.id
}
