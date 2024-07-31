resource "azurerm_virtual_machine" "backend" {
  depends_on            = [azurerm_mssql_server.main, azurerm_sql_database.main]
  name                  = "backendVM"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [azurerm_network_interface.backend.id]
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name              = "backendOSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_profile {
    computer_name  = "backendvm"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "dev"
  }
}