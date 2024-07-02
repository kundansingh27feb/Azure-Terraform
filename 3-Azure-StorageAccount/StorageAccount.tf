resource "azurerm_resource_group" "gurukulsiksha" {
  name     = "gurukulsiksha1"
  location = "westus"
}
resource "azurerm_storage_account" "gurukulStorageAccount" {
  name                     = "gurukulstoerageaccount1"
  resource_group_name      = azurerm_resource_group.gurukulsiksha.name
  location                 = azurerm_resource_group.gurukulsiksha.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    created_BY = "Terraform"
  }
}