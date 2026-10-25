
variable "resource_group_name" {
  description = "Resource group for the private endpoint"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "private_endpoint_name" {
  description = "Name of the Storage private endpoint"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the private endpoint is created"
  type        = string
}

variable "storage_account_id" {
  description = "Storage Account resource ID"
  type        = string
}

variable "private_dns_zone_id" {
  description = "Private DNS zone resource ID for Blob Storage"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
