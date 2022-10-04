resource "azurerm_cosmosdb_account" "this" {
  name                          = var.cosmos_account_name
  location                      = local.location
  resource_group_name           = data.azurerm_resource_group.this.name
  offer_type                    = "Standard"
  kind                          = var.cosmos_api == "mongo" ? "MongoDB" : "GlobalDocumentDB"
  public_network_access_enabled = true
  ip_range_filter               = "0.0.0.0,159.49.0.0/24,4.35.246.0/24,50.228.14.0/24,63.236.113.225/24,63.236.116.0/24,97.113.149.9/32"


  enable_automatic_failover       = var.auto_failover
  enable_free_tier                = var.free_tier
  enable_multiple_write_locations = var.multi_region_write

  tags = var.required_tags

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }

  dynamic "capabilities" {
    for_each = var.cosmos_api == "sql" ? [] : [1]
    content {
      name = var.capabilities[var.cosmos_api]
    }
  }

  dynamic "capabilities" {
    for_each = var.additional_capabilities != null ? var.additional_capabilities : []
    content {
      name = capabilities.value
    }
  }

  dynamic "geo_location" {
    for_each = var.geo_locations
    content {
      location          = geo_location.value["geo_location"]
      failover_priority = geo_location.value["failover_priority"]
      zone_redundant    = geo_location.value["zone_redundant"]
    }
  }

  dynamic "backup" {
    for_each = var.backup_enabled == true ? [1] : []
    content {
      type                = title(var.backup_type)
      interval_in_minutes = lower(var.backup_type) == "periodic" ? var.backup_interval : ""
      retention_in_hours  = lower(var.backup_type) == "periodic" ? var.backup_retention : ""
    }
  }

  dynamic "identity" {
    for_each = var.enable_systemassigned_identity ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  lifecycle {
    ignore_changes = [
      default_identity_type
    ]
  }
}









