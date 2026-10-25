
resource "azurerm_public_ip" "vpn" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_virtual_network_gateway" "main" {
  name                = var.gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  type          = "Vpn"
  vpn_type      = "RouteBased"
  sku           = var.gateway_sku
  active_active = false
  bgp_enabled   = false

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpn.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }

  vpn_client_configuration {
    address_space        = var.vpn_client_address_pool
    vpn_client_protocols = ["OpenVPN"]
    vpn_auth_types       = ["AAD"]

    aad_tenant   = "https://login.microsoftonline.com/${var.tenant_id}"
    aad_audience = var.vpn_client_audience
    aad_issuer   = var.vpn_client_issuer
  }

  tags = var.tags
}
