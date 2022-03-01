module "kvsecret" {
    source = #"path to module in registry/kvsecret"
    version = #"version-number-of-module.56"

    #tags for Modules
        tag_alt_product         = var.tag_alt_product
        tag_product             = var.tag_product
        tag_created_by          = var.tag_created_by
        tag_creation_method     = var.tag_creation_method
        tag_env                 = var.tag_env
        tag_subscription        = var.tag_subscription
        tag_team_assigned       = var.tag_team_assigned

        key_vault_id            = module.keyvault.keyvault_id
        secrets                 = var.secrets

         depends_on = [
          #module.keyvaultrbac
          module.keyvault
  ]
}  

#data "azurerm_key_vault_secret" "secret" {
#  name = keys(var.secrets)[0]
#  key_vault_id = module.keyvault.keyvault_id
#
# 
#}