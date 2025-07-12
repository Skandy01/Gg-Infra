resource "azurerm_mssql_database" "name" {
  name = var.mssql_database_name
  server_id = var.server_id
}