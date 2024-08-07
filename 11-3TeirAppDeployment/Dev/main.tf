module "resource_group_dev" {
  source  = "../modules/ResourceGroup"
  rg_info = var.rg_details
}
# module "storage_account_dev" {
#   depends_on = [module.resource_group_dev]
#   source     = "../modules/StorageAccount"
#   sa_info    = var.sa_details
# }

module "vnet_dev" {
  depends_on = [module.resource_group_dev]
  source     = "../modules/VirtualNetwork/"
  vnet       = var.vnet
  subnet     = var.subnet
}