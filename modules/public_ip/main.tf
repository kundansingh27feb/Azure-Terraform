# public_ip/main.tf
resource "azurerm_public_ip" "example" {
    for_each = var.public_ip
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
}
output "public_ip_ids" {
  value = { for k, v in azurerm_public_ip.example : k => v.id }
}