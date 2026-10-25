
variable "resource_group_name" {
  description = "Resource group for the DNS resolver"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "dns_resolver_name" {
  description = "Azure DNS Private Resolver name"
  type        = string
}

variable "vnet_id" {
  description = "VNet ID that hosts the DNS Private Resolver"
  type        = string
}

variable "inbound_endpoint_name" {
  description = "DNS resolver inbound endpoint name"
  type        = string
}

variable "inbound_subnet_id" {
  description = "Delegated subnet ID for the inbound endpoint"
  type        = string
}

variable "inbound_private_ip" {
  description = "Static private IP for the inbound endpoint"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
