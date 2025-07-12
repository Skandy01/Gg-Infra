resource "azurerm_mssql_server" "sql_server" {
    name                        = var.mssql_server_name
    resource_group_name = var.resource_group_name
    location = var.location
    version = "12.0"
    administrator_login = var.administrator_login
    administrator_login_password = var.administrator_login_password
    minimum_tls_version = "1.2"

    azuread_administrator {
        login_username = var.administrator_login
        object_id = var.administrator_object_id
    }

}