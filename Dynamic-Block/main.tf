resource "azurerm_resource_group" "rg" {
    for_each = var.rg
    name = "${var.prefix}-${each.value.name}"
    location = each.value.location
    tags = merge(local.tags, local.custom-rg-tag)
}


resource "azurerm_virtual_network" "vnet" {
  name = "${var.prefix}-vet"
  resource_group_name = azurerm_resource_group.rg["rg1"].name
  location = azurerm_resource_group.rg["rg1"].location
  address_space = ["10.0.0.0/16"]
  dynamic "subnet" {
    for_each = var.subnet
    content {
        name = subnet.value.name
        address_prefixes = subnet.value.address_prefixes
    }
  }
tags = local.tags
}


output "rg_details" {
  value = {for rg-name, rg in azurerm_resource_group.rg : rg-name => rg.name}
}
output "location-details" {
   value = {for loc-name, rg in azurerm_resource_group.rg : loc-name => rg.location}
       # value = [ for loc-name in azurerm_resource_group.rg : loc-name.location ] 
}
output "subnet" {
  value = [ for subnet in azurerm_virtual_network.vnet.subnet : subnet.name ]  
  #value = azurerm_virtual_network.vnet
  #value = element(tolist(azurerm_virtual_network.vnet.subnet[*].id), 0)
  #value = element(tolist(azurerm_virtual_network.vnet.subnet[*].id), 1)
}