
resource_group_name = "sonarqubeapi-test-group"
location            = "westus2"
cosmos_account_name = "sqapi"
cosmos_api          = "mongo"
mongo_dbs = {
  one = {
    db_name           = "sqmgrapi"
    db_throughput     = 400
    db_max_throughput = 1000
  }
}

mongo_db_collections = {
  one = {
    collection_name           = "ProjectTags"
    db_name                   = "sqmgrapi"
    default_ttl_seconds       = "2592000"
    shard_key                 = "ShardKey"
    collection_throughout     = 400
    collection_max_throughput = null
    analytical_storage_ttl    = null
    indexes = {
      indexone = {
        mongo_index_keys   = ["_id"]
        mongo_index_unique = true
      }
    }
  },
}

tags = {
  applicationname = "sonarqubeapi"
  contact         = "devsecops.admins@alaskaair.com"
  environment     = "test"
  inuse           = "true"
  productname     = "security"
  team            = "devsecops"
}

public_network_access_enabled = true
ip_firewall_enabled           = true
firewall_ip                   = ["159.49.0.0"]
