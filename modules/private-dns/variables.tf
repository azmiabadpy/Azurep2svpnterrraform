
variable "resource_group_name" {
  description = "Resource group for the private DNS zone"
  type        = string
}

variable "private_dns_zone_name" {
  description = "Private DNS zone for Azure Blob Storage"
  type        = string
  default     = "privatelink.blob.core.windows.net"
}

variable "vnet_id" {
  description = "VNet ID to link to the private DNS zone"
  type        = string
}

variable "registration_enabled" {
  description = "Enable automatic VM DNS registration"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
