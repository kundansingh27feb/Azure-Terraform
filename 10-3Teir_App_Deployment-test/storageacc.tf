
# resource "azurerm_storage_account" "main" {
#   name                     = "gurukulsikshamysags"  # Must be globally unique
#   resource_group_name      = azurerm_resource_group.main.name
#   location                 = azurerm_resource_group.main.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "dev"
#   }
# }

# resource "azurerm_storage_container" "scripts" {
#   name                  = "scripts"
#   storage_account_name  = azurerm_storage_account.main.name
#   container_access_type = "private"
# }

# resource "azurerm_storage_blob" "script" {
#   name                   = "install.sh"
#   storage_account_name   = azurerm_storage_account.main.name
#   storage_container_name = azurerm_storage_container.scripts.name
#   type                   = "Block"
#   source                 = "install.sh"  # Path to your local script file
# }
# output "script_url" {
#   value = "https://${azurerm_storage_account.main.name}.blob.core.windows.net/${azurerm_storage_container.scripts.name}/${azurerm_storage_blob.script.name}"
# }
# data "azurerm_client_config" "current" {}

# resource "azurerm_role_assignment" "example" {
#   principal_id           = data.azurerm_client_config.current.object_id
#   role_definition_name   = "Storage Blob Data Contributor"
#   scope                  = azurerm_storage_account.main.id
# }
