provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "gurukul-rg" {
  name     = "aks_rg"
  location = "Central India"
}

resource "azurerm_kubernetes_cluster" "gurukul_aks" {
  name                = "gurukulsiksha"
  location            = azurerm_resource_group.gurukul-rg.location
  resource_group_name = azurerm_resource_group.gurukul-rg.name
  dns_prefix          = "gurukulsiksha-aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.gurukul_aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.gurukul_aks.kube_config_raw

  sensitive = true
}