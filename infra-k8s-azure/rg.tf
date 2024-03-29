module "rg" {
 
  source  = #"path to module in registry/rg"
  version = #"version-number-of-module.46"
  
  #modification may be needed if the module has changed since last update
  #input vars - tags, location below here
  location                                                                              = var.rg_location
  tag_alt_product                                                                       = var.tag_alt_product
  tag_product                                                                           = var.tag_product
  tag_created_by                                                                        = var.tag_created_by
  tag_env                                                                               = var.tag_env
  tag_subscription                                                                      = var.tag_subscription
  tag_team_assigned                                                                     = var.tag_team_assigned
}