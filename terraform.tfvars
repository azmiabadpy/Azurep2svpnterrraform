
resource_group_name = "terrafromp2s"
location            = "indiasouthcentral"

# VNet A: Private storage and DNS resources
vnet_a_name          = "tf-pes-vnet-a"
vnet_a_address_space = ["10.10.0.0/16"]

private_endpoint_subnet_name   = "private-endpoint-subnet"
private_endpoint_subnet_prefix = ["10.10.1.0/24"]

dns_resolver_subnet_name   = "dns-resolver-subnet"
dns_resolver_subnet_prefix = ["10.10.2.0/28"]

# VNet B: VPN gateway network
vnet_b_name          = "tf-vnet-b"
vnet_b_address_space = ["10.20.0.0/16"]

gateway_subnet_prefix = ["10.20.0.0/27"]

# Common resource tags
tags = {
  Environment = "Learning"
  ManagedBy   = "Terraform"
  Project     = "PrivateBlobP2SVPN"
}

storage_account_name     = "azmipe2stract"
account_replication_type = "LRS"
container_name           = "privatefiles"


dns_resolver_name     = "tf-p2s-dns-resolver"
inbound_endpoint_name = "tf-dns-inbound"
inbound_private_ip    = "10.10.2.4"

private_endpoint_name = "tf-p2s-blob-endpoint"


gateway_name   = "tf-p2s-vpn-gateway"
public_ip_name = "tf-p2s-vpn-public-ip"
gateway_sku    = "VpnGw1AZ"

# P2S clients receive IPs from this pool
vpn_client_address_pool = ["172.21.0.0/24"]

# Azure for Students tenant
tenant_id = "ad1654a1-99e5-4f1c-89c1-ac9f890d5155"

vpn_client_issuer = "https://sts.windows.net/ad1654a1-99e5-4f1c-89c1-ac9f890d5155/"

