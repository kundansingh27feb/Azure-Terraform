
resource "azurerm_subnet" "main" {
  for_each = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

output "subnet_ids" {
  value = { for k, v in azurerm_subnet.main : k => v.id }
}