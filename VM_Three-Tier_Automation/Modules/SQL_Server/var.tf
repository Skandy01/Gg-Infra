variable "mssql_server_name" {
    description = "The name of the SQL Server instance."
    type        = string
}

variable "resource_group_name" {
    description = "The name of the resource group where the SQL Server will be created."
    type        = string
}

variable "location" {
    description = "The Azure region where the SQL Server will be created."
    type        = string
}

variable "administrator_login" {
    description = "The administrator login name for the SQL Server."
    type        = string
}

variable "administrator_login_password" {
    description = "The password for the SQL Server administrator login."
    type        = string
}

variable "administrator_object_id" {
    description = "The object ID of the Azure AD administrator for the SQL Server."
    type        = string
}
