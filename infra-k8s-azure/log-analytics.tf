module "la" {
  source = "gitlab.com/zywave/terraform/loganalytics"
  version = "1.0.0-rc.5"

  name                                  = var.log_analytics_workspace_name
  resource_group_name                   = module.rg.rg_name
  location                              = module.rg.rg_location
  sku                                   = var.log_analytics_workspace_sku
  retention_days                        = var.log_analytics_workspace_retention_days
  daily_quota_gb                        = var.log_analytics_workspace_daily_quota_gb
  reservation_capacity_per_day          = var.log_analytics_workspace_reservation_capacity_per_day
  
  #tags for Modules
      tag_alt_product         = var.tag_alt_product
      tag_product             = var.tag_product
      tag_created_by          = var.tag_created_by
      tag_creation_method     = var.tag_creation_method
      tag_env                 = var.tag_env
      tag_subscription        = var.tag_subscription
      
}