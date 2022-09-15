resourceGroupName   = "TerraformTest-test-group"
location            = "westus2"
cosmos_account_name = "terraformtestcomos"
cosmos_api          = "mongo"
mongo_dbs = {
  one = {
    db_name           = "TfTest"
    db_throughput     = 400
    db_max_throughput = 1000
  }
}

mongo_db_collections = {
  one = {
    collection_name           = "collectiontest"
    db_name                   = "TfTest"
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

required_tags = {
  ApplicationName = "TestCosmosModule"
  Contact         = "devsecops.admins@alaskaair.com"
  Environment     = "TEST"
  InUse           = "true"
  ProductName     = "security"
  Team            = "devsecops"
}

