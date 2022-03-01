module "keyvaultrbac" {
  source = #"path to module in registry/keyvaultrbac"
  version = #"version-number-of-module.21"
  
  role_scope_kv         = module.keyvault.keyvault_id
  ad_group_objectID     = var.aad_user_or_group_objectIDs
  using_sql             = var.using_sql
  sql_secret            = keys(var.secrets)[0]
  key_vault_edit_role   = var.key_vault_edit_role
  sql_user_msi          = module.az_sql.msi

   depends_on = [
    module.keyvault
  ]
}