variable "rg" {
  type    = string
  default = "3tier-rg-gs"
}
variable "location" {
  type    = string
  default = "Central India"
}

variable "vnet_name" {
  type    = string
  default = "3tier-vnet"
}

variable "subnet_names" {
  type    = list(string)
  default = ["frontendSubnet", "backendSubnet", "dbSubnet"]
}

variable "address_space" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "admin_username" {
  type    = string
  default = "gurukul"
}

variable "admin_password" {
  type    = string
  default = "P@ssw0rd1234!"
}
variable "sql_admin_username" {
  type    = string
  default = "sqladmin"
}

variable "sql_admin_password" {
  type    = string
  default = "P@ssw0rd1234!"
}
