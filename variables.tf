
variable "resource_group_name" {
  description = "Existing Azure resource group name"
  type        = string
}

variable "location" {
  description = "Azure deployment region"
  type        = string
}

variable "vnet_a_name" {
  description = "Private resources virtual network name"
  type        = string
}

variable "vnet_a_address_space" {
  description = "VNet A address spaces"
  type        = list(string)
}

variable "private_endpoint_subnet_name" {
  description = "Private endpoint subnet name"
  type        = string
}

variable "private_endpoint_subnet_prefix" {
  description = "Private endpoint subnet CIDR prefixes"
  type        = list(string)
}

variable "dns_resolver_subnet_name" {
  description = "DNS resolver subnet name"
  type        = string
}

variable "dns_resolver_subnet_prefix" {
  description = "DNS resolver subnet CIDR prefixes"
  type        = list(string)
}

variable "vnet_b_name" {
  description = "VPN virtual network name"
  type        = string
}

variable "vnet_b_address_space" {
  description = "VNet B address spaces"
  type        = list(string)
}

variable "gateway_subnet_prefix" {
  description = "VPN Gateway subnet CIDR prefixes"
  type        = list(string)
}

variable "tags" {
  description = "Tags applied to Azure resources"
  type        = map(string)
  default     = {}
}

variable "storage_account_name" {
  description = "Globally unique Storage Account name"
  type        = string
}

variable "account_replication_type" {
  description = "Storage redundancy setting"
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "Private Blob container name"
  type        = string
}

variable "private_dns_zone_name" {
  description = "Private DNS zone for Blob Storage"
  type        = string
  default     = "privatelink.blob.core.windows.net"
}

variable "dns_resolver_name" {
  description = "Azure DNS Private Resolver name"
  type        = string
}

variable "inbound_endpoint_name" {
  description = "DNS resolver inbound endpoint name"
  type        = string
}

variable "inbound_private_ip" {
  description = "Static IP for the DNS inbound endpoint"
  type        = string
}

variable "private_endpoint_name" {
  description = "Name of the Blob Storage private endpoint"
  type        = string
}


variable "gateway_name" {
  description = "VPN Gateway name"
  type        = string
}

variable "public_ip_name" {
  description = "VPN Gateway public IP name"
  type        = string
}

variable "gateway_sku" {
  description = "VPN Gateway SKU"
  type        = string
  default     = "VpnGw1"
}

variable "vpn_client_address_pool" {
  description = "Address pool for VPN clients"
  type        = list(string)
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID"
  type        = string
}

variable "vpn_client_audience" {
  description = "Azure VPN Client application audience"
  type        = string
  default     = "c632b3df-fb67-4d84-bdcf-b95ad541b5c8"
}

variable "vpn_client_issuer" {
  description = "Microsoft Entra token issuer URL"
  type        = string
}
