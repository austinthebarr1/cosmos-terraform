data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# Acessing AzureRM provider configuration
data "azurerm_client_config" "current" {
}





