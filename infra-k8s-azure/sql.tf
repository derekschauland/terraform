module "az_sql" {
  source = "gitlab.com/zywave/terraform/sql"
  version = "1.0.0-rc.19"

  az_sql_name                                           = local.az_sql_name 
  az_sql_resource_group_name                            = module.rg.rg_name
  az_sql_location                                       = module.rg.rg_location
  az_sql_version                                        = var.az_sql_server_version
  az_sql_admin_login                                    = keys(var.secrets)[0]
  az_sql_admin_password                                 = module.kvsecret.secrets[keys(var.secrets)[0]].secret #data.azurerm_key_vault_secret.secret.value #from kv - will be a random
  az_sql_tls_version                                    = var.az_sql_tls_version
  az_sql_aad_admin_user                                 = var.az_sql_aad_admin_user #user or group name that be the admin
  az_sql_aad_admin_objectid                             = var.az_sql_aad_admin_objectid #user or group object id for the admin - not sure if name and obj are needed
  az_sql_aad_only_enabled                               = var.az_sql_aad_only_login_enabled

  az_sql_public_access_enabled                          = var.az_sql_public_access_enabled

  az_sql_db_name                                        = local.az_sqldb_name
  az_sql_server_id                                      = var.az_sql_server_id
  az_sql_db_collation                                   = var.az_sql_db_collation
  az_sql_license_type                                   = var.az_sql_db_license_type
  az_sql_db_max_size_gb                                 = var.az_sql_db_max_size_gb #likely will be null
  az_sql_db_read_scale_enabled                          = var.az_sql_db_read_scale_enabled
  az_sql_db_sku_name                                    = var.az_sql_db_sku_name
  az_sql_db_zone_redundancy_enabled                     = var.az_sql_db_zone_redundancy_enabled
  az_sql_db_read_replica_count                          = (var.az_sql_db_read_scale_enabled == true ? var.az_sql_db_read_replica_count : 0)
  az_sql_db_storage_account_type                        = var.az_sql_db_storage_account_type

  az_sql_db_threat_detection_enabled                    = (var.az_sql_db_threat_detection_enabled == true ? "Enabled" : "Disabled")
  az_sql_db_threat_alerts_skipped                       = var.az_sql_db_threat_alerts_skipped #list of items to skip
  az_sql_db_threat_detect_email_admins_enabled          = (var.az_sql_db_threat_detect_email_admins_enabled == true ? "Enabled" : "Disabled")
  az_sql_db_threat_email_addresses                      = var.az_sql_db_threat_email_addresses #list of email addresses to send threat stuff
  az_sql_db_threat_retention_days                       = var.az_sql_db_threat_retention_days
  az_sql_db_storage_account_key                         = module.storage.primary_access_key #get this from storage module output
  az_sql_db_storage_endpoint                            = module.storage.primary_blob_endpoint #get this from storage module output

  az_sql_db_weekly_retention                            = var.az_sql_db_weekly_retention #ISO 8601 formatted retention weeks
  az_sql_db_monthly_retention                           = var.az_sql_db_monthly_retention #ISO 8601 formatted retention months
  az_sql_db_yearly_retention                            = var.az_sql_db_yearly_retention #ISO 8601 formatted retention years 
  az_sql_db_yearly_backup_week                          = var.az_sql_db_yearly_backup_week

  az_sql_db_short_term_retention_days                   = var.az_sql_db_short_term_retention_days 

  az_sql_server_audit_enabled                           = var.az_sql_server_audit_enabled
  az_sql_db_audit_enabled                               = var.az_sql_db_audit_enabled
  az_sql_audit_storage_endpoint                         = module.storage.primary_blob_endpoint
  az_sql_audit_storage_key                              = module.storage.primary_access_key
  az_sql_audit_retention_days                           = var.az_sql_audit_retention_days



  #tags for Modules
      tag_alt_product         = var.tag_alt_product
      tag_product             = var.tag_product
      tag_created_by          = var.tag_created_by
      tag_creation_method     = var.tag_creation_method
      tag_env                 = var.tag_env
      tag_subscription        = var.tag_subscription
      tag_team_assigned       = var.tag_team_assigned

}  