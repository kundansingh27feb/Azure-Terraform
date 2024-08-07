resource "azurerm_virtual_network" "main" {
  name                = var.vnet.name
  address_space       = [var.vnet.address_space]
  location            = var.vnet.location
  resource_group_name = var.vnet.resource_group_name
}

resource "azurerm_subnet" "main" {
  for_each = toset(var.subnet.name)
  name                 = each.value
  resource_group_name  = var.subnet.resource_group_name
  virtual_network_name = var.subnet.virtual_network_name
  address_prefixes     = [var.subnet.address_prefixes[index(var.subnet.name, each.value)]]
}