terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "3.113.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "5ef24a7e-16a5-481a-a087-871ca20d8cb4"
}