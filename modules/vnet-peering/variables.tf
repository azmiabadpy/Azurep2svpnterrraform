
variable "resource_group_name" {
  description = "Resource group containing both VNets"
  type        = string
}

variable "vnet_a_name" {
  description = "Name of VNet A"
  type        = string
}

variable "vnet_a_id" {
  description = "Resource ID of VNet A"
  type        = string
}

variable "vnet_b_name" {
  description = "Name of VNet B"
  type        = string
}

variable "vnet_b_id" {
  description = "Resource ID of VNet B"
  type        = string
}
