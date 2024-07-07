# Configure Backend with Blob Storage:
#
After creating Sorage account and Storage Container in last lab Now, we are using the same sotrage account and container to configure your Terraform backend to use Azure Blob Storage. You can specify the container you just created as the backend container:

# Create provider.tf file with below content

```
terraform {
    required_version = ">= 1.8.5"
    backend "azurerm" {
        resource_group_name = "gurukulsiksha-rg"
        storage_account_name = "gurukulsikshasa"
        container_name = "gurukulsiksha-sc"
        key = gurukulsiksha.tfstate
    }
    required_providers {
        azurerm = {
            source = hashicorp/azurerm
            version = "3.110.0"
        }
    }
}
```

# initialize: 

Run `terraform init` to configure backend. Type Yes to accept the backend change from local to remote

# Important Notes:

Terraform requires a backend configuration before initializing, so you may need to perform the backend configuration manually after creating the storage account and container.

Ensure your Azure credentials are correctly configured for Terraform to interact with Azure services.

By following these steps, you can sequentially create an Azure Storage Account, then a container within that account, and use that container for storing your Terraform state file as an Azure Blob. This approach allows you to manage both infrastructure and state management within a single Terraform configuration file effectively.