module "resource_group_dev" {
  source  = "../../modules/ResourceGroup"
  rg_info = var.rg_details
}
module "storage_account_dev" {
  depends_on = [ module.resource_group_dev ]
  source = "../../modules/StorageAccount"
  sa_info = var.sa_details
}