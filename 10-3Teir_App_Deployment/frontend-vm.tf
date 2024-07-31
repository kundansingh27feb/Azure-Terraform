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
resource "azurerm_virtual_machine_extension" "frontend_script" {
  name                 = "frontend-script"
  virtual_machine_id   = azurerm_virtual_machine.frontend.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  settings = <<SETTINGS
{
  "fileUris": ["https://devpankaj1.blob.core.windows.net/pankajcontiner/my.sh?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2024-07-21T22:41:09Z&st=2024-07-19T14:41:09Z&spr=https&sig=b37zbwt1oQCzN3WdCZ9zI%2F7fitytS5o5zFIj4NLXd0g%3D"],
  "commandToExecute": "chmod +x my.sh && ./my.sh"
}
SETTINGS
}