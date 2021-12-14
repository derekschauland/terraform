terraform {
    backend "http" {
      address="https://gitlab.com/api/v4/projects/#########/terraform/state/infra-k8s-azure"
      lock_address="https://gitlab.com/api/v4/projects/#########/terraform/state/infra-k8s-azure/lock"
      unlock_address="https://gitlab.com/api/v4/projects/########/terraform/state/infra-k8s-azure/lock"
      lock_method="POST"
      
      unlock_method="DELETE"
      retry_wait_min=5

  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "2.86.0"
      }
  }
}



provider "azurerm" {
    features {}
    
    alias = "remote"
    subscription_id = "##########82-ab8e-69$$$$$c77" #hub
    
 #subscription chosen inside of workspace in terraform cloud    
}
