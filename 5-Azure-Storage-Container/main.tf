provider "azurerm" {
    features {}
}

#Creating Rerouce Group gurukulsiksha-rg here

resource "azurerm_resource_group" "gurukul-rg" {
    name = "gurukulsiksha-rg"
    location = "westus"
}

#Creating Storage Account gurukulsiksha-sa here

resource "azurerm_storage_account" "gurukul-sa" {
    name = "gurukulsikshasa"
    resource_group_name = azurerm_resource_group.gurukul-rg.name
    location = azurerm_resource_group.gurukul-rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

# Now Creating Container and will use it to save our .tfstate files

resource "azurerm_storage_container" "gurukul-sc" {
    name = "gurukulsiksha-sc"
    storage_account_name = azurerm_storage_account.gurukul-sa.name  
    container_access_type = "private"
}