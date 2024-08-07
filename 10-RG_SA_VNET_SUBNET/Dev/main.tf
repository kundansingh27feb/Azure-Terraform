module "ResourceGroup" {
  source = "../modules/RG"
  rg = var.rg_info
}
module "storageAccount" {
  depends_on = [ module.ResourceGroup ]
  source = "../modules/storageaccount"
  sa = var.sa_info
}

module "VirtulaNetwork" {
  depends_on = [ module.ResourceGroup ]
  source = "../modules/vnet"
  vnet = var.vnet_info
}
module "subnet" {
  depends_on = [ module.ResourceGroup, module.VirtulaNetwork]
  source = "../modules/subnet"
  subnet = var.subnet_info
}