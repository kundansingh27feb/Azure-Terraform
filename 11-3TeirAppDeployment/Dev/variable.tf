variable "rg_details" {
  type = map(any)
}
variable "sa_details" {
  type = map(any)
}

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