
variable "resource_group_name" {
  description = "Resource group for the VPN Gateway"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "gateway_name" {
  description = "Azure VPN Gateway name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP resource name for the gateway"
  type        = string
}

variable "gateway_subnet_id" {
  description = "GatewaySubnet resource ID"
  type        = string
}

variable "gateway_sku" {
  description = "VPN Gateway SKU"
  type        = string
  default     = "VpnGw1"
}

variable "vpn_client_address_pool" {
  description = "IP address pool assigned to VPN clients"
  type        = list(string)
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID used for VPN authentication"
  type        = string
}

variable "vpn_client_audience" {
  description = "Microsoft-registered Azure VPN Client application audience"
  type        = string
  default     = "c632b3df-fb67-4d84-bdcf-b95ad541b5c8"
}

variable "vpn_client_issuer" {
  description = "Microsoft Entra Secure Token Service issuer URL"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
