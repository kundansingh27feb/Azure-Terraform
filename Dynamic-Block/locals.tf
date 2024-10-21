locals {
  tags = {
      environment = var.env
      Client = var.client
      Application_Code = var.app-code
      mission = var.mission
  }
  custom-rg-tag = {
    rg-type = "dev-tacos-charli-mangal"
  }
}