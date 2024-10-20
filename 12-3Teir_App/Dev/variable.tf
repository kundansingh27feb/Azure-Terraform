variable "rg_details" {
  type = map(any)
}
variable "sa_details" {
  type = map(any)
}

variable "vnet" {
  type = map(any)
}
variable "subnet1" {
  type = map(object({
    name                 = string
    address_prefixes     = list(string)
  }))
}

# variable "public_ip" {
#   type = map(any)
# }

variable "network_interfaces" {
  type = map(any)
}


variable "vm_config" {
  description = "Configuration map for the virtual machine"
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    network_interface_ids = string
    vm_size               = string
    os_disk = object({
      name              = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })
    image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    admin_credentials = object({
      username = string
      password = string
    })
    disable_password_authentication = bool
    tags                            = map(string)
  }))
}
