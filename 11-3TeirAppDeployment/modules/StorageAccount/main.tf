resource "azurerm_storage_account" "Storage_Account" {
    for_each = var.sa_info
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    name = each.key
    account_replication_type = each.value.account_replication_type
    account_tier = each.value.account_tier
}