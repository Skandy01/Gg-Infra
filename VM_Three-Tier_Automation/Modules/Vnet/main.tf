resource "azurerm_virtual_network" "Vnet-3-Tier" {
    
    name = var.vnet_name
    resource_group_name = var.resource_group_name
    location = var.vnet_location
    address_space = var.address_space
}