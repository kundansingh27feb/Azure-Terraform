provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.rg
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = [var.address_space]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_prefixes[count.index]]
}