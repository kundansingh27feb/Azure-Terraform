resource "azurerm_virtual_machine" "frontend" {
  name                 = "frontendVM"
  location             = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.frontend.id]
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name                 = "frontendOSDisk"
    caching              = "ReadWrite"
    create_option        = "FromImage"
    managed_disk_type    = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_profile {
    computer_name       = "frontendvm"
    admin_username      = var.admin_username
    admin_password      = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "dev"
  }
    identity {
    type = "SystemAssigned"  # Enable system-assigned identity
  }
}

# Custom Script Extension for Provisioning
# resource "azurerm_virtual_machine_extension" "frontend_script" {
#   name                 = "frontend-script"
#   virtual_machine_id   = azurerm_virtual_machine.frontend.id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "2.0"
#   settings = <<SETTINGS
# {
#   "fileUris": ["https://devpankaj1.blob.core.windows.net/pankajcontiner/my.sh?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2024-07-31T04:06:15Z&st=2024-07-20T20:06:15Z&spr=https&sig=pCyfgRy0VZaUA8l%2FC%2BjO2XEeQKcLZuwaYP5dKcIb5DE%3D"],
#   "commandToExecute": "PUBLIC_IP=${azurerm_public_ip.frontend.ip_address} chmod +x my.sh && PUBLIC_IP=${azurerm_public_ip.frontend.ip_address} ./my.sh"
# }
# SETTINGS
# }
resource "azurerm_virtual_machine_extension" "frontend_script" {
  name                 = "frontend-script"
  virtual_machine_id   = azurerm_virtual_machine.frontend.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  settings = <<SETTINGS
{
  "fileUris": ["https://${azurerm_storage_account.main.name}.blob.core.windows.net/${azurerm_storage_container.scripts.name}/${azurerm_storage_blob.script.name}"],
  "commandToExecute": "PUBLIC_IP=${azurerm_public_ip.frontend.ip_address} chmod +x install.sh && PUBLIC_IP=${azurerm_public_ip.frontend.ip_address} ./install.sh"
}
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
{
  "storageAccountName": "${azurerm_storage_account.main.name}",
  "storageAccountKey": "${azurerm_storage_account.main.primary_access_key}"
}
PROTECTED_SETTINGS
}