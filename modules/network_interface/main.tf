resource "azurerm_network_interface" "interface" {
  for_each = var.network_interfaces

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = each.value.public_ip_id
  }
}
resource "azurerm_network_interface_security_group_association" "nsg_association" {
  for_each = var.network_interfaces

  network_interface_id = azurerm_network_interface.interface[each.key].id
  network_security_group_id = each.value.network_security_group_id
}
output "network_interface_ids" {
  value = { for k, v in azurerm_network_interface.interface : k => v.id }
}
