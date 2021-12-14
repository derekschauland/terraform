data "azurerm_virtual_network" "remote_vnet" {
  #provider = azurerm.remote
  name = var.project_vnet_name
  resource_group_name = var.project_vnet_rg
 
}
output "vnet_id" {
  value = data.azurerm_virtual_network.remote_vnet.id
} # this data block should only be needed once per project with connections

data "azurerm_virtual_hub" "remote_vhub" {
  provider = azurerm.remote
  name = var.remote_vhub_name
  resource_group_name = var.remote_vhub_rg
}

output "vhub_id" {
  value = data.azurerm_virtual_hub.remote_vhub.id
}

data "azurerm_subscription" "current" {
  
}

output "current_sub" {
  value = data.azurerm_subscription.current.display_name
}

# remote vnet connection  - 
module "vhubcon_remote" {
  
  source = "#########"
  version = "1.0.0-rc.21"
  providers = {
    azurerm.vhubcon = azurerm.remote
    
   }
  #for_each = local.network_ids #{for i, v in local.network_ids: i=>v}
  
   vhub_conn_name = var.vhub_conn_name[0] #each.key
   #vhub_id = module.vhub.hub_id
   vhub_id = data.azurerm_virtual_hub.remote_vhub.id # what goes here - hub id module.vhub.hub_id
   #data.azurerm_virtual_hub.vhub.id
   #project_vnet_id = module.vnet.vnet_id 
   project_vnet_id = data.azurerm_virtual_network.remote_vnet.id #module.vnet.vnet_id # #module.vnet.vnet_id


    #tags for Modules
        tag_alt_product         = var.tag_alt_product
        tag_product             = var.tag_product
        tag_created_by          = var.tag_created_by
        tag_creation_method     = var.tag_creation_method
        tag_env                 = var.tag_env
        tag_subscription        = var.tag_subscription
        tag_team_assigned       = var.tag_team_assigned

        
}
