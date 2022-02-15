variable "tag_subscription" {
    description = "The Azure Subsctiption name"
    default = ""
}

variable "tag_env" {
    description = "The Environment where this resource will be used (Dev/Test/Sandbox/Prod)"
    default = ""
}

variable "tag_product" {
    description = "The Active Coterie product name this resource will be used with"
    default = ""
}

variable "tag_created_by" {
    description = "The name of the user who is creating this resource"
    default = ""
}

variable "tag_alt_product" {
    description = "the Alternate Coterie Product name for the product this reesource will be used with (ie. BOP20 vs RatingEngine)"
    default = ""
}

variable "tag_creation_method" {
    description = "the method used to create this resource"
    default = "terraform"
}

variable "tag_team_assigned" {
    description = "the team that will be using this resource"
    default = ""
}
variable "rg_location" {
    description = "the location for the resource"
   
}

variable "k8s_name" {
    description = "the k8s cluster name"
    default = ""
}

variable "k8s_identity_type" {
    description = "the identity type"
    default = ""
}

variable "dns_prefix" {
    description = "a dns prefix for this cluster"
    default = ""
}

variable "k8s_default_pool_name" {
    description = "the name for the default node pool"
    default = ""
}

variable "default_node_count" {
    description = "how many nodes by default"
    type = number
    default = 2
}

variable "auto_scale_node_vm_size" {
    description = "the vm size for the nodes"
    default = ""
}
variable "azure_ad_tenant_id" {
    description = "Enter the azure ad tenant id"
    default = ""
}

variable "managed_by_aad" {
    description = "True or False - should this cluster be managed by azure ad"
    type = bool
    default = false
}

variable "aad_rbac_enabled" {
    description = "True or False - should rbac be controlled by azure ad"
    type = bool
    default = false
}
variable "availability_zones" {
    type = list(number)
    description = "The availability zones to use - can be one or more"
    default = [1,2,3]
}
variable "use_auto_scale" {
    description = "True or False - enter the description of what this will enable"
    type = bool
    default = false
}

variable "enable_azure_policy" {
    description = "True or False - should azure policy be used"
    type = bool
    default = false
}

variable "enable_private_cluster" {
    description = "True or False - this cluster should be private"
    type = bool
    default = false
}

variable "enable_private_with_public_fqdn" {
    description = "True or False - this private cluster should have a public fqdn"
    type = bool
    default = false
}

variable "private_dns_zone_name" {
    description = "name of the private dns zone to use for private endpoint aks"
    default = ""
}

variable "private_dns_zone_id" {
    description = "the private dns zone id"
    default = "System"
}

variable "k8s_sku" {
    description = "Choose the SKU for this cluster - Free or Paid"
    default = ""
}

variable "auto_scale_expander" {
    description = "how the cluster should be expanded - least-waste, most-pods, priority, random be thy choices"
    default = "least-waste"
}

variable "k8s_max_node_provisioning_time" {
    description = "what is the max provisioning time desired for this cluster"
    default = "1m"
}
variable "k8s_new_pod_scaleup_delay" {
    description = "how long should the cluster wait befor scailing up new pods"
    default = "30m"
}
variable "k8s_pod_scaledown_delay" {
    description = "how long should the cluster wait before scaling down"
    default = "30m"
}
variable "k8s_pod_scaledown_delete_delay" {
    description = "how long should the cluster wait after a delete to scale down"
    default = "30m"
}
variable "k8s_pod_scaledown_failure_delay" {
    description = "how long should the cluste wait to scale down after a failure"
    default = "30m"
}
variable "k8s_pod_scaledown_unneeded" {
    description = "how long should the pod wait to scale down unneeded nodez"
    default = "30m"
}
variable "k8s_pod_scaledown_unready" {
    description = "how long should the cluster wait to scale down pods that are unready"
    default = "20m"
}
variable "k8s_pod_scan_interval" {
    description = "how often should this cluster be scanned"
    default = "10m"
}
variable "kv_random_pet" {
    description = "True or False - should this key vault use random pet for naming"
    type = bool
    default = false
}

variable "kv_rbac_auth" {
    description = "True or False - should this key vault use aad rbac for auth"
    type = bool
    default = false
}

variable "secrets" {
    description = "Secrets kept in this key vault - shhhhh"
    type = map(object({
        value = string
    }))

    default = {}
}

variable "role_scope_kv" {
    description = "the key vault this group should also be scoped to... should come from kv mod"
    default = ""
}
variable "key_vault_edit_role" {
    description = "the role to allow edit of keyvault"
    default = "Key Vault Secrets Officer"
}

variable "aad_user_or_group_objectIDs" {
    description = "The object ID of the group that will manage this key vault"
    type = list(string)
    default = [""]
}

variable "using_sql" {
    description = "True or False - this set of resources will build an azure sql instance"
    type = bool
    default = false
}

variable "sql_user_msi" {
    description = "the MSI of the SQL Server resource that will access this here secret"
    default = ""
}

variable "enable_k8s_permissions" {
    description = "True or False - should we setup permissions for the aks cluster"
    type = bool
    default = false
}

variable "k8s_cluster_permissions_assignment" {
    type = string
    description = "what user or group object ids should be assigned permissions "
    default = ""
}

variable "storage_tier" {
    description = "The tier used for this storage account"
    default = ""
}

variable "storage_replication" {
    description = "The level of replication configured for this storage account (LRS/GRS/Etc)"
    default = "LRS"
}

variable "location" {
    description = "The location for this resource"
    default = "eastus"
}
variable "storage_account_name" {
    description = "A name for a storage account"
    default = ""
}

variable "storage_kind" {
    description = "What kind of storage account is this"
    default = ""
}

variable "storage_hns" {
    description = "Is Hierarchical Namespace enabled - needed for datalake storage only"
    type = bool
    default = false
}

variable "min_tls_version" {
    description = "The minimum TLS version 1.2 or greater only"
    default = "1.2"
}

variable "vnet_address_spaces" {
    type = list(string)
    description = "address space(s) for the vnet - can be one or more"
    default = []
}

variable "subnet_name" {
    description = "the name of the subnet"
    default = ""
}

variable "subnets" {
    type = map(object({

        cidr = list(string)

    }))
    description = "enter the map description"
    }

variable "max_pods_per_node" {
    type = number
    description = "how many pods per cluster node?"
    default = 0
}

variable "vnet_remote_name" {
    description = "the name of the remote vnet to peer against"
    default = ""
}

variable "vnet_remote_resource_group" {
    description = "the name of the resource group containing the remote vnet"
    default = ""
}
variable "shared_resource_groups" {
    type = list(string)
    description = "The names of the resource groups - can be one or more"
    default = []
}

variable "vnet_peer_local_vnet_name" {
    description = "the name of the local vnet this peer is associated with"
    default = ""
}

variable "vnet_peer_remote_vnet_id" {
    description = "the id of the remote vnet this peer connects with"
    default = ""
}

variable "enable_vnet_access" {
    description = "True or False - allow access to this vnet across the peer"
    type = bool
    default = false
}

variable "enable_forwarded_traffic" {
    description = "True or False - allow traffic forwarding across the peer"
    type = bool
    default = false
}

variable "enable_gateway_transit" {
    description = "True or False - allow this peer to send local traffic to the internet"
    type = bool
    default = false
}

variable "enable_use_remote_gateways" {
    description = "True or False - allow this peer to send traffic to the internet over a remote gateway"
    type = bool
    default = false
}
variable "vnet_peer_name" {
    description = "the name of this network peer resource"
    default = ""
}

variable "vnet_peer_resource_group" {
    description = "the resource group of the vnet peer"
    default = ""
}

variable "vhub_conn_name" {
    description = "the name of the connection"
    default = ""
}

variable "vhub_remote_name" {
    description = "the name of the remote vhub"
    default = ""
}

variable "vhub_remote_resource_group" {
    description = "the resource group name of the remote vhub"
    default = ""
}

variable "files_name" {
    description = "the name of the file share"
    default = ""
}

variable "files_quota" {
    type = number
    description = "the max size of the file share being created"
    default = 10
}
variable "files_enabled_protocol" {
    description = "the file storage protocol to use - SMB or NFS - default is SMB"
    default = ""
}

variable "appgw_name" {
    description = "the name assigned to the app gw resource"
    default = ""
}

variable "appgw_sku_name" {
    description = "the sku for this instance of app gw"
    default = ""
}

variable "appgw_sku_tier" {
    description = "the tier of the appgw sku"
    default = ""
}

variable "appgw_sku_capacity" {
    type = number
    description = "the number of nodes for the app gateway"
    default = 1
}

variable "appgw_ip_config_name" {
    description = "the name of the app gateway ip config"
    default = ""
}

variable "appgw_frontend_port" {
    type = number
    description = "the front end port used by the gw"
    default = 443
}

variable "bool_appgw_cookie_based_affinity" {
    description = "True or False - should this app gateway use cookie based affinity"
    default = false
}

variable "appgw_backend_http_path" {
    description = "the path to the backend used by this gateway"
    default = ""
}

variable "appgw_backend_http_port" {
    type = number
    description = "the backend port used by this gw"
    default = 80
}

variable "appgw_backend_http_protocol" {
    description = "the protocol used in accessing the backend"
    default = ""
}

variable "appgw_backend_http_request_timeout" {
    type = number
    description = "Number of seconds before request times out"
    default = 60
}
variable "appgw_request_routing_rule_type" {
    description = "routing rule type"
    default = ""
}

variable "pip_name" {
    description = "the name of the public Ip resource"
    default = ""
 }

 variable "pip_resource_group_name" {
     description = "the resource group for the pip"
     default = ""
  }
variable "pip_location" {
    description = "the location or region for the pip"
    default = ""
 }

variable "pip_allocation_method" {
    description = "Enter a description here"
    default = ""
}

variable "pip_sku" {
    description = "sku for the public ip - Basic or Standard"
    default = "Standard"
}

variable "pip_sku_tier" {
    description = "the tier for the pip sku - Regional or Global"
    default = "Regional"
}


variable "bool_k8s_iag_enabled" {
    description = "True or False - should the k8s managed iag be enabled"
    type = bool
    default = false
}

variable "k8s_iag_gw_name" {
    description = "the name for the ingress app gateway"
    default = ""
}

variable "k8s_iag_subnet_cidr" {
    description = "the subnet cidr for placing the gateway"
    default = ""
}

variable "k8s_iag_subnet_id" {
    description = "the subnet id for use with ingress app gw"
    default = ""
}

variable "auto_scale_min_nodes" {
    type = number
    description = "minimum nodes when autoscale is used"
    default = 3
}

variable "auto_scale_max_nodes" {
    type = number
    description = "maximum nodes when autoscale is used"
    default = 5
}
variable "log_analytics_workspace_name" {
    description = "the name of the log analytics workspace"
    
}


variable "log_analytics_workspace_sku" {
    description = "the sku for the log analytics workspace"
 
}

variable "log_analytics_workspace_retention_days" {
    description = "How many days should this data be retained"
    type = number
}

variable "log_analytics_workspace_daily_quota_gb" {
    description = "The daily quota of ingested data allowed per day in GB"
    default  = "0.5GB"
}

variable "log_analytics_workspace_reservation_capacity_per_day" {
    description = "how much capacity per day is allowed"
    type = number
    default = 0
}

variable "log_analytics_enabled" {
    description = "True or False - should this cluster send data to log analytics"
    type = bool
    default = false
}
variable "project_vnet_name" {
    description = "the name of the remote vnet you wish to connect to"
    default = ""
}

variable "project_vnet_rg" {
    description = "the resource group of the remote vnet"
    default = ""
}

variable "remote_vhub_name" {
    description = "the name of the remote vhub"
    default = ""
}

variable "remote_vhub_rg" {
    description = "the rg of the remote vhub"
    default = ""
}

variable "enable_k8s_autoupgrade" {
    description = "True or False - should this cluster be auto upgraded"
    type = bool
    default = false
}

variable "k8s_autoupgrade_channel" {
    description = "which channel should this cluster use for auto upgrade"
    default = "stable"
}

variable "acr_name" {
    description = "the name of the azure container registry this aks uses"
    default = ""
}

variable "acr_rg" {
    description = "the name of the resource group the acr that this aks uses"
    default = ""
}

variable "enable_k8s_kube_dashboard" {
    description = "True or False - should the kube dashboard be enabled"
    type = bool
    default = false
}

variable "k8s_node_disk_size" {
    type = number
    description = "size in GB of the os disk for aks nodes"
    default = 20
}
variable "k8s_keyvault_secrets_enabled" {
    description = "True or False - this aks instance should use keyvault for secrets"
    type = bool
    default = false
}

variable "k8s_keyvault_secret_rotation_enabled" {
    description = "True or False - AKS secrets stored in keyvault should be rotated"
    type = bool
    default = false
}

variable "k8s_keyvault_secret_rotation_interval" {
    description = "How often should data in keyvault for AKS be rotated"
    default = ""
}

variable "k8s_docker_bridge_ip" {
    description = "the docker bridge ip address - should be /32"
    default = ""
}

variable "k8s_dns_service_ip" {
    description = "the ranges for DNS - can be one or more"
    default = ""
}

variable "k8s_service_cidr" {
    description = "an IP for the k8s service"
    default = ""
}
variable "bastion_name" {
    description = "name for the bastion host"
    default = ""
}
variable "bastion_pip_name" {
    description = "name for bastion host public_ip"
    default = ""
}

variable "bastion_sku" {
    description = "Which Sku should this bastion host use - standard or basic"
    default = ""
}

variable "sql_fwrules" {
    type = map(object({

        start_ip = string
        end_ip = string

    }))
    description = "enter the map description"
    }

variable "az_sql_name" {
    description = "the name of the SQL server being provisioned"
    default = ""
}

variable "az_sql_server_version" {
    description = "the version of the SQL server being provisioned"
    default = ""
}

variable "az_sql_tls_version" {
    description = "the version of TLS used"
    default = ""
}

variable "az_sql_aad_admin_user" {
    description = "the user or group name to use as the admin"
    default = ""
}

variable "az_sql_aad_admin_objectid" {
    description = "the aad object id of the user or group who is admin - should be the object id for the user/group listed in aad_admin_user"
    default = ""
}

variable "az_sql_aad_only_login_enabled" {
    description = "True or False - this SQL server should only allow aad login"
    type = bool
    default = false
}
variable "az_sql_public_access_enabled" {
    description = "True or False - should public access be enabled for this server"
    type = bool
    default = false
}

variable "az_sql_db_name" {
    description = "the name of the database being provisioned"
    default = ""
}

variable "az_sql_server_id" {
    description = "the id of the sql server hosting db - set to null"
    default = null
}

variable "az_sql_db_collation" {
    description = "the collation scheme for this db"
    default = ""
}

variable "az_sql_db_license_type" {
    description = "what sql db liense should be used"
    default = ""
}
variable "az_sql_db_max_size_gb" {
    type = number
    description = "the max size for the db"
    default = null
}

variable "az_sql_db_read_scale_enabled" {
    description = "True or False - should read replica be enabled"
    type = bool
    default = false
}

variable "az_sql_db_read_replica_count" {
    type = number
    description = "how many read replicas do you want"
    default = 0
}

variable "az_sql_db_sku_name" {
    description = "the db sku to use"
    default = ""
}

variable "az_sql_db_zone_redundancy_enabled" {
    description = "True or False - should this db have zone redundancy enabled"
    type = bool
    default = false
}

variable "az_sql_db_storage_account_type" {
    description = "what type of storage account should this db use"
    default = ""
}
variable "az_sql_db_threat_detection_enabled" {
    description = "True or False - should threat detection be enabled"
    type = bool
    default = false
}

variable "az_sql_db_threat_alerts_skipped" {
    type = list(string)
    description = "the names of threats to be skipped in alerting"
    default = []
}

variable "az_sql_db_threat_detect_email_admins_enabled" {
    type = bool
    description = "Should admins be emailed for threats detected"
    default = false
}
variable "az_sql_db_threat_email_addresses" {
    type = list(string)
    description = "The email addresses to send alerts to - can be one or more"
    default = []
}

variable "az_sql_db_threat_retention_days" {
    type = number
    description = "number of days to keep threat info"
    default = 1
}

variable "az_sql_db_weekly_retention" {
    description = "ISO 8601 formatted weekly retention setting"
    default = ""
}

variable "az_sql_db_yearly_retention" {
    description = "ISO 8601 formatted yearly retention setting"
    default = ""
}

variable "az_sql_db_monthly_retention" {
    description = "ISO 8601 formatted monthly retention setting"
    default = ""
}

variable "az_sql_db_yearly_backup_week" {
    type = number
    description = "the number of the week when yearly backup should be captured"
    default = 48
}

variable "az_sql_db_short_term_retention_days" {
    type = number
    description = "the number of days to keep short term snapshots"
    default = 35
}


variable "az_sql_server_audit_enabled" {
    description = "True or False - SQL server level audit enabled"
    type = bool
    default = false
}
variable "az_sql_db_audit_enabled" {
    description = "True or False - database level audit enabled"
    type = bool
    default = false
}

variable "az_sql_audit_retention_days" {
    type = number
    description = "number of days to keep audit data"
    default = 30
}