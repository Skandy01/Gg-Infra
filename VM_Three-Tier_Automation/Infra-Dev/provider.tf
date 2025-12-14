terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.33.0"
        }
    }
    
} 

provider "azurerm" {
    subscription_id = "22135bdc-d3fd-4095-9a18-2094dab79b13"
    features {}
}

