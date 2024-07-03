provider "azurerm" {
  features {}
}

# Resource group for my three tier application
resource "azurerm_resource_group" "three-tier-rg" {
  name     = "three-tier-rg"
  location = "Canada Central"
  tags = {
  Created_By = "Terraform"
  owner       = "Kundan Singh"
  }
}

# Virtual network(vnet) for my three tier application
resource "azurerm_virtual_network" "three-tier-vnet" {
  name                = "three-tier-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.three-tier-rg.location
  resource_group_name = azurerm_resource_group.three-tier-rg.name
  tags = {
  Created_By = "Terraform"
  owner       = "Kundan Singh"
  }
}

# Front-end subnet for my three tier application
resource "azurerm_subnet" "frontend" {
  name                 = "front-end-subnet"
  resource_group_name  = azurerm_resource_group.three-tier-rg.name
  virtual_network_name = azurerm_virtual_network.three-tier-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Back-end subnet for my three tier application
resource "azurerm_subnet" "backend" {
  name                 = "back-end-subnet"
  resource_group_name  = azurerm_resource_group.three-tier-rg.name
  virtual_network_name = azurerm_virtual_network.three-tier-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Database subnet for my three tier application
resource "azurerm_subnet" "database" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.three-tier-rg.name
  virtual_network_name = azurerm_virtual_network.three-tier-vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}