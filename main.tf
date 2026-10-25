

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}


module "networking" {
  source = "./modules/networking"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  vnet_a_name                    = var.vnet_a_name
  vnet_a_address_space           = var.vnet_a_address_space
  private_endpoint_subnet_name   = var.private_endpoint_subnet_name
  private_endpoint_subnet_prefix = var.private_endpoint_subnet_prefix
  dns_resolver_subnet_name       = var.dns_resolver_subnet_name
  dns_resolver_subnet_prefix     = var.dns_resolver_subnet_prefix

  vnet_b_name           = var.vnet_b_name
  vnet_b_address_space  = var.vnet_b_address_space
  gateway_subnet_prefix = var.gateway_subnet_prefix

  tags = var.tags
}

module "storage" {
  source = "./modules/storage"

  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  storage_account_name     = var.storage_account_name
  account_replication_type = var.account_replication_type
  container_name           = var.container_name

  tags = var.tags
}


module "private_dns" {
  source = "./modules/private-dns"

  resource_group_name   = azurerm_resource_group.main.name
  private_dns_zone_name = var.private_dns_zone_name
  vnet_id               = module.networking.vnet_a_id
  tags                  = var.tags
}


module "dns_resolver" {
  source = "./modules/dns-resolver"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  dns_resolver_name     = var.dns_resolver_name
  vnet_id               = module.networking.vnet_a_id
  inbound_endpoint_name = var.inbound_endpoint_name
  inbound_subnet_id     = module.networking.dns_resolver_subnet_id
  inbound_private_ip    = var.inbound_private_ip

  tags = var.tags
}


module "private_endpoint" {
  source = "./modules/private-endpoint"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  private_endpoint_name = var.private_endpoint_name
  subnet_id             = module.networking.private_endpoint_subnet_id
  storage_account_id    = module.storage.storage_account_id
  private_dns_zone_id   = module.private_dns.private_dns_zone_id

  tags = var.tags
}


module "vnet_peering" {
  source = "./modules/vnet-peering"

  resource_group_name = azurerm_resource_group.main.name

  vnet_a_name = module.networking.vnet_a_name
  vnet_a_id   = module.networking.vnet_a_id

  vnet_b_name = module.networking.vnet_b_name
  vnet_b_id   = module.networking.vnet_b_id
  depends_on  = [module.vpn_gateway]
}


module "vpn_gateway" {
  source = "./modules/vpn-gateway"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  gateway_name      = var.gateway_name
  public_ip_name    = var.public_ip_name
  gateway_sku       = var.gateway_sku
  gateway_subnet_id = module.networking.gateway_subnet_id

  vpn_client_address_pool = var.vpn_client_address_pool
  tenant_id               = var.tenant_id
  vpn_client_audience     = var.vpn_client_audience
  vpn_client_issuer       = var.vpn_client_issuer

  tags = var.tags
}
