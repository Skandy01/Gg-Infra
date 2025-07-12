terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.33.0"
        }
    }
    
} 

provider "azurerm" {
    subscription_id = "19fa1140-ae73-433b-a3e6-3aab93fcf378"
    features {}
}

