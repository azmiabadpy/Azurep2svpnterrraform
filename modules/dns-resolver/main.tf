
resource "azurerm_private_dns_resolver" "main" {
  name                = var.dns_resolver_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_id  = var.vnet_id

  tags = var.tags
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "main" {
  name                    = var.inbound_endpoint_name
  private_dns_resolver_id = azurerm_private_dns_resolver.main.id
  location                = var.location

  ip_configurations {
    private_ip_allocation_method = "Static"
    private_ip_address           = var.inbound_private_ip
    subnet_id                    = var.inbound_subnet_id
  }

  tags = var.tags
}
