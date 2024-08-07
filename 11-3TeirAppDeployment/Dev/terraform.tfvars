rg_details = {
  rg1 = {
    name     = "3-teir-arch-dev"
    location = "westus"
  }
}

sa_details = {
  devgurukulsikshasa = {
    resource_group_name      = "3-teir-arch-dev"
    location                 = "westus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

vnet = {
  name                = "3-teir-vnet"
  address_space       = "10.0.0.0/16"
  location            = "westus"
  resource_group_name = "3-teir-arch-dev"
}

subnet = {
  name                 = ["frontendSubnet", "backendSubnet", "dbSubnet"]
  resource_group_name  = "3-teir-arch-dev"
  virtual_network_name = "3-teir-vnet"
  address_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}