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
    default = "2"
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

variable "ad_group_objectID" {
    description = "The object ID of the group that will manage this key vault"
    default = ""
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
    default = "Basic"
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

