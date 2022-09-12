locals {
  location             = var.location != "" ? var.location : data.azurerm_resource_group.this.location
}