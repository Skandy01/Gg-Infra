terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.33.0"
        }
    }
    
} 

provider "azurerm" {
    subscription_id = "9c521f44-ae8d-4736-9337-a8ab0038c6c7"
    features {}
}

