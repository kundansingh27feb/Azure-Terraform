resource "azurerm_resource_group" "rg" {
    name = "GurukulSiksha"
    location = "westus"
}
resource "azurerm_virtual_network" "vnet" {
    name = "gurukul-vnet"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "subnet" {
    name = "gurukul-subnet"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.1.0/24"]
}
resource "azurerm_public_ip" "public_ip" {
    name = "Gurukul_Public_IP"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    allocation_method = "Static"
}
resource "azurerm_lb" "gurukul_lb" {
  name = "Gurukul-LoadBalancer"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Standard"
  frontend_ip_configuration {
    name = "Frontend-lb-config"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_lb_backend_address_pool" "Backend-lb-pool" {
  name = "Backend-LB-Pool"
  loadbalancer_id = azurerm_lb.gurukul_lb.id
}
resource "azurerm_lb_probe" "gurukul-lb-probe" {
    name = "Gurukul-LB-Probe"
    loadbalancer_id = azurerm_lb.gurukul_lb.id
    port = 80
}
resource "azurerm_lb_rule" "gurukul-lb-rule" {
  name = "Gurukul-LB-Rule"
  loadbalancer_id = azurerm_lb.gurukul_lb.id
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  frontend_ip_configuration_name = "Frontend-lb-config"
  probe_id = azurerm_lb_probe.gurukul-lb-probe.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.Backend-lb-pool.id]
}