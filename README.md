# Azure-Terraform
# What is Terraform? why we use it?
#
Its a opensource tool that is developed by HashiCorp. it is used to define datacenter infrastructure using code which is writen in HCL(Hashicorp Configuration Langurage). its supports multiple cloud like Azure, GCP, AWS and many others. Through Terraform, we can create, read, update, and delete infrastructure resources. It can communicate with Any Cloud using provider.
#
# Provider: 
#
Provider is nothing but a mediator between cloud and terraform That tells the terraform in which cloud we have to create the resources.

A provider in Terraform is a plugin that serves as an intermediary between Terraform and a specific cloud platform, service, or infrastructure. Providers define the resources and data sources that Terraform can manage and interact with. They enable Terraform to communicate with APIs to create, update, and delete infrastructure resources in a consistent and predictable manner.
#
# Terraform Workflow:

```terraform init```
```terraform plan```
```terraform apply```
```terraform destroy```

# Other commands:

```terraform validate```
```terraform fmt```

# Advance Command:

```terraform init --upgrade```
```terraform apply --auto-approve```
```terraform destroy --auto-approve```

# Using Azure Provider:

```
terraform {
	required_providers {
		azurerm = {
			source = "hashicorp/azurerm"
			version = "3.108.0"
		}
	}
}
provider "azurerm" {
	features{}
}
```
# Creating Resource Group:

```
resource "azurerm_resource_group" "gurukulsiksha" {
	name = "mygurukulsiksha1"
	localtion = "westus"
}
```

# Creating Storage Account:

```

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

```