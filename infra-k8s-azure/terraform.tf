
    terraform {
    backend "http" {
      address="https://" #address for remote state in https backend
      lock_address="https://" #lock address for remote state in https backend - add /lock to end
      unlock_address="https://" #unlock address for remote state in https backend - add /lock to end
      lock_method="POST"
      
      unlock_method="DELETE"
      retry_wait_min=5

    }

  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "2.90.0"
      }
      azuread = {
        source = "hashicorp/azuread"
        version = "~> 2.15.0"
      }
  }
}


provider "azurerm" {
    features {}
    
    alias = "remote"
    subscription_id = "" #subscription ID that will be remote from this project
   
}

provider "azurerm" {
  features {}

  
  subscription_id = ""   #subscription id that will be local to this project

}

provider "azuread" {
  tenant_id = "" #tenant id for azure ad 
}
