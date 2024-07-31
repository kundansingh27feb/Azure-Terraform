# variable "str_example" {
#   type    = string
#   default = "kundan"
# }

# variable "num_example" {
#   type    = string
#   default = 12
# }
# variable "rb-test" {} # variable declaration
# variable "location-test" {}  # variable declaration

# resource "azurerm_resource_group" "group1" {
#     name = var.rb-test # Using variable
#     location = var.location-test #Using variable
# }
variable "grp_list" {
  type    = set(string)
  default = ["kundan", "aman", "Brijesh", "Naveen", "Saurav", "naveen"]  # This will cause an error
}


output "b16_batch" {
  value = var.grp_list
}



# Define a set of Resource Group names
variable "rg_names" {
  type    = set(string)
  default = ["rg1", "rg2", "rg3", "rg4", "rg5"]
}

# Create Resource Groups using for_each
resource "azurerm_resource_group" "example" {
  for_each = var.rg_names

  name     = each.value
  location = "West Europe"
}