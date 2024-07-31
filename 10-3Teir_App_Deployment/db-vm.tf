resource "azurerm_mssql_server" "main" {
  name = "sqlserver01-gurukul"
  resource_group_name= azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  version= "12.0"
  administrator_login= var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  tags = {
    environment = "dev"
  }
}
resource "azurerm_sql_database" "main" {
  name                = "gurukul-db01"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  server_name         = azurerm_mssql_server.main.name
  requested_service_objective_name = "S0"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_sql_firewall_rule" "allow_db_subnet" {
  name                = "allow-db-subnet"
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_mssql_server.main.name
  start_ip_address    = "10.0.3.0"  # Start IP of dbSubnet
  end_ip_address      = "10.0.3.255" # End IP of dbSubnet
}


