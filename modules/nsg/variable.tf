# variable "nsg" {
#   description = "Map of Network Security Groups with their settings"
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     security_rules = list(object({
#       name                       = string
#       priority                   = number
#       direction                  = string
#       access                     = string
#       protocol                   = string
#       source_port_range          = string
#       destination_port_range     = string
#       source_address_prefix      = string
#       destination_address_prefix = string
#     }))
#   }))
# }

variable "nsg" {
 type = map(any)
}