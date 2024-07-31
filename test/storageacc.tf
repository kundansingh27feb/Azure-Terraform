resource "azurerm_storage_account" "main" {
  name                     = "mygurukulsikshastor"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "scripts" {
  name                  = "scripts"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "script" {
  name                   = "install.sh"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.scripts.name
  type                   = "Block"
  source                 = "install.sh"
}

data "azurerm_storage_account_sas" "example" {
  connection_string = azurerm_storage_account.main.primary_connection_string

  https_only = true
  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob = true
  }

  start  = "2024-07-20T00:00:00Z"
  expiry = "2024-12-31T23:59:59Z"
  permissions {
    read   = true
  }
}

output "script_url" {
  value = "https://${azurerm_storage_account.main.name}.blob.core.windows.net/${azurerm_storage_container.scripts.name}/${azurerm_storage_blob.script.name}?${data.azurerm_storage_account_sas.example.sas}"
}