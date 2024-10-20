variable "rg" {
  type = map(object({
        name = string
        location = string
  }))
}

variable "prefix" {
  type = string
  default = "gurukul"
}
variable "subnet" {
  type = map(object({
    name = string
    address_prefixes = list(string)
  }))
}