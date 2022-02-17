##############################################################
#                         Tagging Vars                       #
##############################################################
tag_created_by                    = "derek_schauland"
tag_subscription                  = "devsecops (Development)"
tag_env                           = "dev"
tag_product                       = "tools"
tag_alt_product                   = "devsecops-tools"
tag_team_assigned                 = "devsecops"


##############################################################
#                         General and K8s Vars               #
##############################################################
rg_location                       = "centralus"
shared_resource_groups            = ["devsecops"]

k8s_sku = "Free"

bool_k8s_iag_enabled  = true
k8s_node_disk_size = 128
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

acr_name = "zywavedevregistry" # not managed here - just a reference
acr_rg = "zywavedev-registry-centralus-rg" # change to local - fix in container reg project

k8s_keyvault_secrets_enabled = true
k8s_keyvault_secret_rotation_enabled = true
k8s_keyvault_secret_rotation_interval = "3m"

##############################################################
#                         K8s Permissions Vars               #
##############################################################
enable_k8s_permissions = true
k8s_rbac_admin_group_name = "Team - DevSecOps"
#k8s_cluster_permissions_assignment = "3689b6dd-e9b9-48aa-9903-8d23750890b0"
aad_user_or_group_objectIDs = ["3689b6dd-e9b9-48aa-9903-8d23750890b0"]

##############################################################
#                         AutoScale Vars                     #
##############################################################
use_auto_scale = true
auto_scale_min_nodes = 2
auto_scale_max_nodes = 10
auto_scale_node_vm_size = "Standard_D2_v5"

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


sql_fwrules = {
  "rule_1" = {
    start_ip = "172.20.4.5"
    end_ip = "172.20.4.250"
  },
  "dshome_1" = {
    start_ip = "75.87.195.215"
    end_ip = "75.87.195.215"
  },
  "devsql_1" = {
    start_ip = "209.188.107.42"
    end_ip = "209.188.107.42"
  }
}

  

  az_sql_server_version                                   = "12.0"
  az_sql_tls_version                                      = "1.2"
  az_sql_aad_admin_user                                   = "derek schauland" #user or group name that be the admin
  az_sql_aad_admin_objectid                               = "3689b6dd-e9b9-48aa-9903-8d23750890b0" #user or group object id for the admin - not sure if name and obj are needed
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
  az_sql_db_threat_email_addresses                        = ["derek.schauland@zywave.com"] #list of email addresses to send threat stuff
  az_sql_db_threat_retention_days                         = 7
  
  az_sql_db_weekly_retention                              = "P7D" #ISO 8601 formatted retention weeks
  az_sql_db_monthly_retention                             = "P1M"#ISO 8601 formatted retention months
  az_sql_db_yearly_retention                              = "P1Y" #ISO 8601 formatted retention years 
  az_sql_db_yearly_backup_week                            = 48

  az_sql_db_short_term_retention_days                     = 35

  az_sql_server_audit_enabled                             = true
  az_sql_db_audit_enabled                                 = true
 
  az_sql_audit_retention_days                             = 10

##############################################################
#                         Storage Vars                       #
############################################################## 
storage_account_name = "zywavedsosa"
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
vnet_address_spaces = ["172.20.4.0/22"] #should be different from hub stuff


subnets = {
  "devsecops-dev-ingress-gw" = {
    cidr = ["172.20.5.0/24"] #put inside new addr space
    service_delegation = false
  },
  "devsecops-dev-pods-subnet" = {
    cidr = ["172.20.6.0/23"]
    service_delegation = false
  }
} 

k8s_docker_bridge_ip = "10.42.0.11/32"
k8s_dns_service_ip = "10.42.0.10"
k8s_service_cidr = "10.42.0.0/16"

#bastion_name = "zywave-dso-bastion"
#bastion_pip_name = "zywave-bastion-pip"
#bastion_sku = "Standard"
#pip_allocation_method = "Static"
#pip_sku = "Standard"
#pip_sku_tier = "Regional"

#Delete me project_vnet_name = "dso-dev-dsotools-centralus-vnet" #"edge-net-dev-hub-centralus-vnet"# # hub resources 
#Delete me project_vnet_rg = "dso-dev-dsotools-centralus-rg"#"edge-net-dev-hub-vnet-centralus-rg"# #hub resources
#Delete me 
#Delete Me vhub_conn_name = ["devsecops-dev-to-hub-test-peer"]
#Delete Me remote_vhub_name = "dev-edge-hub"
#Delete Me remote_vhub_rg = "dev-hub-vnet-centralus-rg"

##############################################################
#                         LogAnalytics Vars                  #
##############################################################
  log_analytics_workspace_name = "devsecops-aks-la"
  log_analytics_workspace_sku = "PerGB2018"
  log_analytics_workspace_retention_days = 30
  log_analytics_workspace_daily_quota_gb = 1
  log_analytics_workspace_reservation_capacity_per_day = 10

  log_analytics_enabled = true
