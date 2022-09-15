variable "resourceGroupName" {
  type        = string
  description = "Name of the azure resource group you requested in chip."
}

variable "location" {
  type        = string
  description = "Cosmos DB deployment region. Can be different vs. RG location"
  default     = ""
}

variable "cosmos_account_name" {
  type        = string
  description = "Name of the Cosmos DB account."
}

variable "cosmos_api" {
  type        = string
  description = ""
  validation {
    condition     = contains(["sql", "table", "mongo"], lower(var.cosmos_api))
    error_message = "Unsupported cosmos api specified. Supported APIs include sql, table, mongo"
  }
}

variable "environment" {
  type        = string
  description = "Name of the environment. Example TEST, QA, PROD etc..."
  default     = "TEST"


validation {
    condition     = contains(["TEST", "QA", "PROD"], upper(var.environment))
    error_message = "please choose one of the following environment TEST, QA, PROD"
  }
}

variable "consistency_level" {
  type        = string
  description = "The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix"
  default     = "Eventual"
}

variable "max_interval_in_seconds" {
  type        = string
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day)"
  default     = 300
}

variable "max_staleness_prefix" {
  type        = string
  description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647"
  default     = 100000
}

variable "auto_failover" {
  type        = bool
  description = "Enable automatic fail over for this Cosmos DB account - can be either true or false"
  default     = false
}

variable "free_tier" {
  type        = bool
  description = "Enable Free Tier pricing option for this Cosmos DB account - can be either true or false"
  default     = false
}

variable "multi_region_write" {
  type        = bool
  description = "Enable multiple write locations for this Cosmos DB account"
  default     = false
}

variable "backup_enabled" {
  type        = bool
  description = "Enable backup for this Cosmos DB account"
  default     = true
}

variable "backup_type" {
  type        = string
  description = "Type of backup - can be either Periodic or Continuous"
  default     = "periodic"
}

variable "backup_interval" {
  type        = string
  description = "The interval in minutes between two backups. This is configurable only when type is Periodic. Possible values are between 60 and 1440."
  default     = 60
}

variable "backup_retention" {
  type        = string
  description = "The time in hours that each backup is retained. This is configurable only when type is Periodic. Possible values are between 8 and 720."
  default     = 8
}

variable "backup_storage_redundancy" {
  type        = string
  description = "he storage redundancy which is used to indicate type of backup residency. This is configurable only when type is Periodic. Possible values are Geo, Local and Zone"
  default     = "Geo"
}


variable "geo_locations" {
  description = "List of map of geo locations and other properties to create primary and secodanry databasees."
  type        = any
  default = [
    {
      geo_location      = "West Central US"
      failover_priority = 0
      zone_redundant    = false
    },
  ]
}

variable "capabilities" {
  type        = map(any)
  description = "Map of non-sql DB API to enable support for API other than SQL"
  default = {
    sql   = "SQL"
    table = "EnableTable"
    mongo = "EnableMongo"
  }
}

variable "additional_capabilities" {
  type        = list(string)
  description = "List of additional capabilities for Cosmos DB API. - possible options are DisableRateLimitingResponses, EnableAggregationPipeline, EnableServerless, mongoEnableDocLevelTTL, MongoDBv3.4, AllowSelfServeUpgradeToMongo36"
  default     = []
}

variable "enable_systemassigned_identity" {
  type        = bool
  description = "Enable System Assigned Identity"
  default     = false
}


variable "storage_account" {
  type = map(object({
    storage_account_name         = string
    storage_account_rg_name      = string
    enable_logs_retention_policy = bool
    logs_retention_days          = number
  }))
  description = "Storage account parameters for one or more storage account to send daignostic logs to storage account."
  default     = {}
}


variable "required_tags" {
  description = "Required tags for the resource"
  type = object({
    ApplicationName = string
    Contact         = string
    Environment     = string
    InUse           = string
    ProductName     = string
    Team            = string
  })

  validation {
    condition     = contains(["TEST", "QA", "PROD"], upper(var.required_tags.Environment))
    error_message = "please choose one of the following environment TEST, QA, PROD"
  }
  validation {
    condition     = contains(["TRUE", "FALSE"], upper(var.required_tags.InUse))
    error_message = "InUse takes true or false"
  }
}