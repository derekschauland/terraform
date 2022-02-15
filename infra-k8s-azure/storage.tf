module "storage" {
  source = "gitlab.com/zywave/terraform/storage"
  version = "1.0.0-rc.45"

  storage_account_name                       = local.storage_account_name
  resource_group_name        = module.rg.rg_name
  storage_tier               = var.storage_tier
  storage_replication   = var.storage_replication
  storage_kind               = var.storage_kind
  storage_hns             = var.storage_hns
  min_tls_version            = var.min_tls_version
  location                   = module.rg.rg_location

  
}

resource "azurerm_role_assignment" "storageaccess" {
  scope = module.storage.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id = module.az_sql.msi
}