
# VNet A initiates peering to VNet B
resource "azurerm_virtual_network_peering" "a_to_b" {
  name                      = "${var.vnet_a_name}-to-${var.vnet_b_name}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_a_name
  remote_virtual_network_id = var.vnet_b_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # VNet A is the gateway VNet's remote peer.
  allow_gateway_transit = false
  use_remote_gateways   = true
}

# VNet B initiates peering to VNet A
resource "azurerm_virtual_network_peering" "b_to_a" {
  name                      = "${var.vnet_b_name}-to-${var.vnet_a_name}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.vnet_b_name
  remote_virtual_network_id = var.vnet_a_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # VNet B owns the VPN Gateway.
  allow_gateway_transit = true
  use_remote_gateways   = false
}
