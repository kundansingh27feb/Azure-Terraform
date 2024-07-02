terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }
}
provider "azurerm" {
  features {}
}
#  resource "azurerm_resource_group" "test1" {
#    name     = "gurukulsiksha1"
#    location = "westus"
# }
resource "azurerm_resource_group" "test2" {
  name     = "gurukulsiksha2"
  location = "westus"
}