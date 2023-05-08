resource "azurerm_resource_group" "example" {
  name     = "example-rg-workshop"
  location = "Australia East"
}

resource "azurerm_resource_group" "example2" {
  name     = "example-rg-workshop2"
  location = "Australia East"
}

provider "azurerm" {
   features {}
}

resource "azurerm_databricks_workspace" "example" {
  name                = "databricks-infra-workshop"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "premium"

  tags = {
    Environment = "Production"
  }
}

module "cluster" {
    source = "./modules/cluster"
}

