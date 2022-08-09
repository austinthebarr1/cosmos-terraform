module "azure_cosmos_db" {
  source               = "Azure/cosmosdb/azurerm"
  resource_group_name  = var.resource_group_name 
  location             = var.location
  cosmos_account_name  = var.cosmos_account_name
  cosmos_api           = var.cosmos_api
  mongo_dbs            = var.mongo_dbs
  mongo_db_collections = var.mongo_db_collections
 
}
