
variable "resource_group_name" {
  description = "Resource group for networking resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_a_name" {
  type = string
}

variable "vnet_a_address_space" {
  type = list(string)
}

variable "private_endpoint_subnet_name" {
  type = string
}

variable "private_endpoint_subnet_prefix" {
  type = list(string)
}

variable "dns_resolver_subnet_name" {
  type = string
}

variable "dns_resolver_subnet_prefix" {
  type = list(string)
}

variable "vnet_b_name" {
  type = string
}

variable "vnet_b_address_space" {
  type = list(string)
}

variable "gateway_subnet_prefix" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}
