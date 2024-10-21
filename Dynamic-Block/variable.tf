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

variable "env" {
  type = string
}
variable "client" {
  type = string
}
variable "app-code" {
      type = string
}
variable "mission" {
      type = string
}
