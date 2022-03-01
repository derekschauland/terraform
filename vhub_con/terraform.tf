terraform {
    backend "http" {
      address="https://<path-to-state>.com/api/v4/projects/#########/terraform/state/{ProjectName}"
      lock_address="https://<path-to-state>.com/api/v4/projects/#########/terraform/state/{ProjectName}/lock"
      unlock_address="https://<path-to-state>.com/api/v4/projects/########/terraform/state/{ProjectName}/lock"
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
