## Changing backend from From Local To Remote

# Create Storage Account:

Before changing the backend we should have the storage account and storage container. So first we will create the storage account and storage container first.

# Provider.tf

Create a tf file with Provider.tf and place the below content:

```
terraform {
    required_version = ">= 1.8.5"
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.110.0"
        }
    }
}
```
# main.tf

Now create one more tf file with main.tf and place the below content.

```
# Creating Rerouce Group gurukulsiksha-rg here

resource "azurerm_resource_group" "gurukul-rg" {
    name = "gurukulsiksha-rg"
    location = "westus"
}

# Creating Storage Account gurukulsiksha-sa here

resource "azurerm_storage_account" "gurukul-sa" {
    name = "gurukulsiksha-sa"
    resource_group_name = azurerm_resource_group.gurukul-rg.name
    location = azurerm_resource_group.gurukul-rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

# Creating Storage Container:

resource "azurerm_storage_container" "gurukul-sc" {
    name = "gurukulsiksha-sc"
    storage_account_name = azurerm_storage_account.gurukul-sa.name  
    container_access_type = "private"
}
```

# Workflow

# Initialization: 

Run terraform init after creating the .tf files to initialize the backend and download necessary provider plugins.

# Apply Configuration:

Use terraform apply to create the storage account and container.

