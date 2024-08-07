resource "azurerm_virtual_machine" "backend" {
  for_each = var.vm_config

  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = each.value.network_interface_ids
  vm_size               = each.value.vm_size

  storage_os_disk {
    name              = each.value.os_disk.name
    caching           = each.value.os_disk.caching
    create_option     = each.value.os_disk.create_option
    managed_disk_type = each.value.os_disk.managed_disk_type
  }

  storage_image_reference {
    publisher = each.value.image_reference.publisher
    offer     = each.value.image_reference.offer
    sku       = each.value.image_reference.sku
    version   = each.value.image_reference.version
  }

  os_profile {
    computer_name  = each.value.name
    admin_username = each.value.admin_credentials.username
    admin_password = each.value.admin_credentials.password
  }

  os_profile_linux_config {
    disable_password_authentication = each.value.disable_password_authentication
  }
  tags = each.value.tags
}