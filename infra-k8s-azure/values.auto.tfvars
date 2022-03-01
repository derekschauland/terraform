##############################################################
#                         Tagging Vars                       #
##############################################################
source_url                  = "url to project repo"
subscription_name                  = "azure sub name"
team_name                 = "team name"

namespace = "name space for resources"
environment = "environment"
resource_name = "schauland"

##############################################################
#                         General and K8s Vars               #
##############################################################
rg_location                       = "centralus"


k8s_sku = "Free"


bool_k8s_iag_enabled  = true
k8s_node_disk_size = 60
enable_azure_policy = true

enable_private_cluster = true
private_dns_zone_name = "System"
enable_k8s_autoupgrade = true
k8s_autoupgrade_channel = "stable"

default_node_count = 3
max_pods_per_node = 50

k8s_max_node_provisioning_time = "10m"
k8s_new_pod_scaleup_delay = "5s"
k8s_pod_scaledown_delay = "10m"
k8s_pod_scaledown_failure_delay = "5m"
k8s_pod_scaledown_unneeded = "5m"
k8s_pod_scaledown_unready = "10m"
k8s_pod_scan_interval = "15s"

acr_name = "containerdevregistry" # not managed here - just a reference
acr_rg = "container-registry-centralus-rg" # change to local - fix in container reg project

k8s_keyvault_secrets_enabled = true
k8s_keyvault_secret_rotation_enabled = true
k8s_keyvault_secret_rotation_interval = "3m"

##############################################################
#                         K8s Permissions Vars               #
##############################################################
enable_k8s_permissions = true
k8s_cluster_permissions_assignment = ["azure ad object id to assign permissions for"]
aad_user_or_group_objectIDs = ["azure ad object id for permissions assignment "]

##############################################################
#                         AutoScale Vars                     #
##############################################################
use_auto_scale = true
auto_scale_min_nodes = 2
auto_scale_max_nodes = 10
auto_scale_node_vm_size = "Standard_D2_V5"

##############################################################
#                         Key Vault Vars                     #
############################################################## 
key_vault_edit_role                 = "Key Vault Administrator"
kv_random_pet = true
kv_rbac_auth = true

secrets = {
 "SQL-Admin" = { # key will be secret name - this is a string obj
         value = "" # value will be secret value
    }#,
  #"secret2" = {
   #   value="" #empty value strings get rando passwords generated :)
  #}    
}

##############################################################
#                         SQL Vars                           #
############################################################## 
using_sql = true #keyvault for pwd


  az_sql_server_version                                   = "12.0"
  az_sql_tls_version                                      = "1.2"
  az_sql_aad_admin_user                                   = "azure sql admin user/group" #user or group name that be the admin
  az_sql_aad_admin_objectid                               = "3689b###-####-####-####-########0b0" #user or group object id for the admin - not sure if name and obj are needed
  az_sql_aad_only_login_enabled                           = false

  az_sql_public_access_enabled                            = true

  
  az_sql_server_id                                        = null
  az_sql_db_collation                                     = "SQL_Latin1_General_CP1_CI_AS"
  az_sql_db_license_type                                  = "LicenseIncluded"
  az_sql_db_max_size_gb                                   = 10 #likely will be null
  az_sql_db_read_scale_enabled                            = false
  az_sql_db_sku_name                                      = "S1"
  az_sql_db_zone_redundancy_enabled                       = false
  az_sql_db_read_replica_count                            = 0
  az_sql_db_storage_account_type                          = "LRS"

  az_sql_db_threat_detection_enabled                      = true
  az_sql_db_threat_alerts_skipped                         = [] #list of items to skip
  az_sql_db_threat_detect_email_admins_enabled            = false
  az_sql_db_threat_email_addresses                        = ["email address used to blast people"] #list of email addresses to send threat stuff
  az_sql_db_threat_retention_days                         = 7
  
  az_sql_db_weekly_retention                              = "P7D" #ISO 8601 formatted retention weeks
  az_sql_db_monthly_retention                             = "P1M"#ISO 8601 formatted retention months
  az_sql_db_yearly_retention                              = "P1Y" #ISO 8601 formatted retention years 
  az_sql_db_yearly_backup_week                            = 48

  az_sql_db_short_term_retention_days                     = 35

  az_sql_server_audit_enabled                             = true
  az_sql_db_audit_enabled                                 = true
 
  az_sql_audit_retention_days                             = 10
  az_fw_start_ips = ["172.20.4.5", "192.168.195.215", "192.168.107.42"]
  az_fw_end_ips = ["172.20.4.250","192.168.195.215", "192.168.107.42"]
  

##############################################################
#                         Storage Vars                       #
############################################################## 
storage_account_name = "storageaccountnamesa"
storage_tier="Standard"
storage_replication="LRS"
storage_kind="StorageV2"
storage_hns = false
min_tls_version="TLS1_2"

files_name = "file-share"
files_quota = 50
files_enabled_protocol = "SMB"

##############################################################
#                         Networking Vars                    #
##############################################################
vnet_address_spaces = ["172.20.4.0/22"] #should be unique for each spoke

subnet_cidr = ["172.20.5.0/24", "172.20.6.0/23"] #please put smaller subnet first - will be used by app gw ingress

#k8s_docker_bridge_ip = "10.42.0.11/32"
#k8s_dns_service_ip = "10.42.0.10"
#k8s_service_cidr = "10.42.0.0/16"

##############################################################
#                         LogAnalytics Vars                  #
##############################################################
  log_analytics_workspace_name = "namespace-aks-la"
  log_analytics_workspace_sku = "PerGB2018"
  log_analytics_workspace_retention_days = 30
  log_analytics_workspace_daily_quota_gb = 1
  log_analytics_workspace_reservation_capacity_per_day = 10

  log_analytics_enabled = true
