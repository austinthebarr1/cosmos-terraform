data "azurerm_resource_group" "this" {
  name = var.resourceGroupName
}

# Acessing AzureRM provider configuration
data "azurerm_client_config" "current" {
}





