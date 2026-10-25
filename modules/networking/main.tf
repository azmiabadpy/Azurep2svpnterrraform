
resource "azurerm_virtual_network" "vnet_a" {
  name                = var.vnet_a_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_a_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "private_endpoint" {
  name                 = var.private_endpoint_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_a.name
  address_prefixes     = var.private_endpoint_subnet_prefix

  private_endpoint_network_policies = "Disabled"
}

resource "azurerm_subnet" "dns_resolver" {
  name                 = var.dns_resolver_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_a.name
  address_prefixes     = var.dns_resolver_subnet_prefix


  delegation {
    name = "dns-resolver-delegation"

    service_delegation {
      name = "Microsoft.Network/dnsResolvers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

resource "azurerm_virtual_network" "vnet_b" {
  name                = var.vnet_b_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_b_address_space
  tags                = var.tags
  dns_servers         = ["10.10.2.4"]
}

resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_b.name
  address_prefixes     = var.gateway_subnet_prefix
}
