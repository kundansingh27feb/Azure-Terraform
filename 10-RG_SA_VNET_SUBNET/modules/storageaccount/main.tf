resource "azurerm_storage_account" "StorageAccount" {
 for_each = var.sa
  name = each.value.name
  account_tier = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  resource_group_name = each.value.rg
  location = each.value.location
 }