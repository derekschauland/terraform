module "vnet" {
  #old source = "gitlab.zywave.com/devsecops/terraform/vnet"
  #old version = "1.0.0-rc.13"
  source = "gitlab.com/zywave/terraform/vnet"
  version = "1.0.0-rc.15"

    #tags for Modules
    tag_alt_product         = var.tag_alt_product
    tag_product             = var.tag_product
    tag_created_by          = var.tag_created_by
    tag_creation_method     = var.tag_creation_method
    tag_env                 = var.tag_env
    tag_subscription        = var.tag_subscription
    tag_team_assigned       = var.tag_team_assigned

    vnet_location = module.rg.rg_location
    vnet_resource_group_name = module.rg.rg_name
    vnet_address_spaces = var.vnet_address_spaces 
}