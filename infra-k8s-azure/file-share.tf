module "fileshare" {
  source = "gitlab.com/zywave/terraform/fileshare"
  version = "1.0.0-rc.2"

  files_name = var.files_name
  files_storage_account_name = module.storage.storage_account_name
  files_quota = var.files_quota
  files_enabled_protocol = var.files_enabled_protocol

}