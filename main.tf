#https://registry.terraform.io/providers/hashicorp/azurerm/#latest/docs/guides/azure_cli

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "name_of_resource_group_like_function_name" { # this name is very important, we will use it later on to accosiate the recourses with it
  name     = "name_resource_group_terraform"
  location = "West Europe"
}

#
resource "azurerm_virtual_network" "Virtual_network_Maria" {
  name                = "virtualNetworkMaria"
  location            = azurerm_resource_group.name_of_resource_group_like_function_name.location #we use the same name of the group from step 17
  resource_group_name = azurerm_resource_group.name_of_resource_group_like_function_name.name
  address_space       = ["10.0.0.0/16"]
}
