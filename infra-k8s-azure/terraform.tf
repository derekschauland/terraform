
    terraform {
    backend "http" {
      address="https://gitlab.com/api/v4/projects/31744272/terraform/state/infra-k8s-azure"
      lock_address="https://gitlab.com/api/v4/projects/31744272/terraform/state/infra-k8s-azure/lock"
      unlock_address="https://gitlab.com/api/v4/projects/31744272/terraform/state/infra-k8s-azure/lock"
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
    subscription_id = "12f662e5-cbb1-4682-ab8e-69a387542c77"
   
}

provider "azurerm" {
  features {}

  
  subscription_id = "8c99c5b5-3384-4bb3-ba5b-f8e259bd2170"   #k8s sub

}

provider "azuread" {
  tenant_id = "bd0c095f-5d66-4273-a209-64796ae91974"
}