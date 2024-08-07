rg_info = {
    rg1 = {
  name = "test"
  location = "westus"
}
}

sa_info = {
    sa1 = {
  name = "gurkulsiksha12345"
  account_tier = "Standard"
  account_replication_type = "LRS"
  location = "westus"
  rg = "test"
}
}

vnet_info = {
  vnet1 = {
    name = "vnet-1"
    resource_group_name = "test"
    location = "westus"
    address_space = "10.0.0.0/16"
  }
}

subnet_info = {
  sub1 = {
    name = "sub-1"
    resource_group_name = "test"
    virtual_network_name = "vnet-1"
    address_prefixes = "10.0.1.0/24"
  }
}