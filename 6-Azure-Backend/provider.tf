terraform {
    required_version = ">= 1.8.5"
    backend "azurerm" {
        resource_group_name = "gurukulsiksha-rg"
        storage_account_name = "gurukulsikshasa"
        container_name = "gurukulsiksha-sc"
        key = "gurukulsiksha.tfstate"
    }
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.110.0"
        }
    }
}