module "resource_group_dev" {
  source  = "../../modules/ResourceGroup"
  rg_info = var.rg_details
}

module "vnet_dev" {
  depends_on = [module.resource_group_dev]
  source     = "../../modules/Network/"
  vnet       = var.vnet
  subnet1 = var.subnet1
}
module "vm_dev" {
  #depends_on = [module.resource_group_dev, module.subnet_dev, module.network_interface]
  depends_on = [ module.network_interface ]
  source     = "../../modules/VirtualMachine/"
    vm_config  = {

    frontend = {
      name                          = var.vm_config["frontend"].name
      location                      = var.vm_config["frontend"].location
      resource_group_name           = var.vm_config["frontend"].resource_group_name
      network_interface_ids         = [module.network_interface.network_interface_ids["network_interface_1"]]
      vm_size                       = var.vm_config["frontend"].vm_size
      os_disk                       = var.vm_config["frontend"].os_disk
      image_reference               = var.vm_config["frontend"].image_reference
      admin_credentials             = var.vm_config["frontend"].admin_credentials
      disable_password_authentication = var.vm_config["frontend"].disable_password_authentication
      tags                          = var.vm_config["frontend"].tags
    }
    backend = {
      name                          = var.vm_config["backend"].name
      location                      = var.vm_config["backend"].location
      resource_group_name           = var.vm_config["backend"].resource_group_name
      network_interface_ids         = [module.network_interface.network_interface_ids["network_interface_2"]]
      vm_size                       = var.vm_config["backend"].vm_size
      os_disk                       = var.vm_config["backend"].os_disk
      image_reference               = var.vm_config["backend"].image_reference
      admin_credentials             = var.vm_config["backend"].admin_credentials
      disable_password_authentication = var.vm_config["backend"].disable_password_authentication
      tags                          = var.vm_config["backend"].tags
    }
  }
}




# module "storage_account_dev" {
#   depends_on = [module.resource_group_dev]
#   source     = "../../modules/StorageAccount"
#   sa_info    = var.sa_details
# }
# module "public_ip" {
#   depends_on = [module.subnet_dev]
#   source     = "../../modules/public_ip/"
#   public_ip  = var.public_ip
# }


