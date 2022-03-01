module "fileshare" {
  source = #path to module in registry 
  version = #version number of module in registry 

  files_name = var.files_name
  files_storage_account_name = module.storage.storage_account_name
  files_quota = var.files_quota
  files_enabled_protocol = var.files_enabled_protocol

}