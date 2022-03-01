module "keyvault" {
  source = #"path to module in registry/keyvault"
  version = #"version-number-of-module.72"

  resource_group_name = module.rg.rg_name
  location = module.rg.rg_location

  use_rbac_auth = var.kv_rbac_auth
  use_random_pet = var.kv_random_pet

  #tags for Modules
      tag_alt_product         = var.tag_alt_product
      tag_product             = var.tag_product
      tag_created_by          = var.tag_created_by
      tag_creation_method     = var.tag_creation_method
      tag_env                 = var.tag_env
      tag_subscription        = var.tag_subscription
      tag_team_assigned       = var.tag_team_assigned

}