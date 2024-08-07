resource "azurerm_network_interface" "frontend" {
  name                = "frontendNIC"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "frontendIPConfig"
    subnet_id                     = azurerm_subnet.main[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}
resource "azurerm_public_ip" "frontend" {
  name                = "frontendPublicIP"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
}

resource "azurerm_public_ip" "backend" {
  name                = "backendPublicIP"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Dynamic"
}
resource "azurerm_network_interface" "backend" {
  name                = "backendNIC"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "backendIPConfig"
    subnet_id                     = azurerm_subnet.main[1].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.backend.id
  }
}
resource "azurerm_network_interface" "db" {
  name                = "dbNIC"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "dbIPConfig"
    subnet_id                     = azurerm_subnet.main[2].id
    private_ip_address_allocation = "Dynamic"
  }
}