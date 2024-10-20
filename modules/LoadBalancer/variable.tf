variable "rg" {
    type = map(string)
}
variable "address_space" {
    type = string
    default = ["10.0.0.0/16"]
}
