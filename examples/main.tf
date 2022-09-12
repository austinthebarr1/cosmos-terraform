# Azure provider version 
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}

provider "azurerm" {
  features {}
}



module "azure_cosmos_db" {
  source               = "../"
  resourceGroupName    = var.resourceGroupName
  location             = var.location
  cosmos_account_name  = var.cosmos_account_name
  cosmos_api           = var.cosmos_api
  required_tags        = var.required_tags
  mongo_db_collections = var.mongo_db_collections
  mongo_dbs            = var.mongo_dbs
}
