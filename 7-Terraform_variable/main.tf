variable "rb-test" {} # variable declaration
variable "location-test" {}  # variable declaration

resource "azurerm_resource_group" "group1" {
    name = var.rb-test # Using variable
    location = var.location-test #Using variable
}