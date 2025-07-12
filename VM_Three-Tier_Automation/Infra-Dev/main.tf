module "resource_group" {

    source = "../Modules/Resource_Group"
    resource_group_name = "todo-resource-group"
    resource_group_location = "South India"
}


module "public_ip" {

    depends_on = [ module.resource_group]
    source = "../Modules/Public_IP"
    pip_name = "todo-public-ip"
    resource_group_name = "todo-resource-group"
    resource_group_location = "South India"
    allocation_method = "Static"
}

module "virtual_network" {

    depends_on = [module.resource_group]
    source = "../Modules/Vnet"
    vnet_name = "todo-vnet"
    resource_group_name = "todo-resource-group"
    vnet_location = "South India"
    address_space = ["10.0.0.0/16"]
}

module "frontend-subnet" {

    depends_on = [module.virtual_network]
    source = "../Modules/Subnet"
    subnet_name = "frontend-subnet"
    resource_group_name = "todo-resource-group"
    virtual_network_name = "todo-vnet"
    address_prefixes = ["10.0.1.0/24"]
}

module "backend-subnet" {

    depends_on = [module.virtual_network]
    source = "../Modules/Subnet"
    subnet_name = "backend-subnet"
    resource_group_name = "todo-resource-group"
    virtual_network_name = "todo-vnet"
    address_prefixes = ["10.0.2.0/24"]
}

module "frontend-vm" {

    depends_on = [module.frontend-subnet]
    source = "../Modules/VM"
    vm_name = "todo-frontend-vm"
    resource_group_name = "todo-resource-group"
    vm_size = "Standard_B1s"
    location = "South India"
    admin_username = "adminuser"
    admin_password = "Pass@123456"
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-jammy"
    image_sku = "22_04-lts"
    nic_name = "nic-frontend"
    subnet_id = "/subscriptions/19fa1140-ae73-433b-a3e6-3aab93fcf378/resourceGroups/todo-resource-group/providers/Microsoft.Network/virtualNetworks/todo-vnet/subnets/frontend-subnet"
    image_version = "latest"

}

module "backend-vm" {

    depends_on = [module.backend-subnet]
    source = "../Modules/VM"
    vm_name = "todo-backend-vm"
    resource_group_name = "todo-resource-group"
    vm_size = "Standard_B1s"
    location = "South India"
    subnet_id = "/subscriptions/19fa1140-ae73-433b-a3e6-3aab93fcf378/resourceGroups/todo-resource-group/providers/Microsoft.Network/virtualNetworks/todo-vnet/subnets/backend-subnet" 
    nic_name = "nic-backend"

    admin_username = "adminuser"
    admin_password = "Pass@123"
  
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-jammy"
    image_sku = "22_04-lts"
    image_version = "latest"
   
}
