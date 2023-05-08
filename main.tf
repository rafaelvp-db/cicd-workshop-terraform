resource "azurerm_resource_group" "example" {
  name     = "example-rg-workshop"
  location = "Australia East"
}

provider "azurerm" {
   features {}
}

resource "azurerm_databricks_workspace" "example" {
  name                = "databricks-infra-workshop"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "standard"

  tags = {
    Environment = "Production"
  }
}

module "cluster" {
    source = "./modules/cluster"
}

