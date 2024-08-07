variable "vnet" {
  type = object({
    name                = string
    address_space       = string
    location            = string
    resource_group_name = string
  })
}

variable "subnet" {
  type = object({
    name                 = list(string)
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  })
}