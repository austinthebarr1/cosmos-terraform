variable "resource_group_name" {}
variable "location" {}
variable "cosmos_account_name" {}
variable "cosmos_api" {}
variable "mongo_dbs" {}
variable "mongo_db_collections" {}
variable "public_network_access_enabled" {
  type        = bool
  description = "Enable public access"
  default = true
}

variable "ip_firewall_enabled" {
  type        = bool
  description = "Enable IP firewall"
}

variable "firewall_ip" {
  type        = list(string)
  description = "List of ip address to allow access from the internet or on-premisis network."
  default     = ["159.49.0.0/16"]
}
