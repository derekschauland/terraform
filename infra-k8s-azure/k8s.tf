module "k8s_cluster" {
  source = #"path to module in registry/k8scluster"
  version = #"version-number-of-module.118"

   k8s_name                               = local.k8s_name
   k8s_location                           = module.rg.rg_location
   k8s_rg                                 = module.rg.rg_name 
   k8s_dns_prefix                         = local.dns_prefix
   

   enable_k8s_permissions                 = var.enable_k8s_permissions
   
   k8s_cluster_permissions_assignment     = data.azuread_group.dso.object_id #var.k8s_cluster_permissions_assignment
#   k8s_cluster_permissions_assignment     = var.k8s_cluster_permissions_assignment
   k8s_auto_upgrade                       = var.enable_k8s_autoupgrade
   k8s_autoupgrade_channel                = var.k8s_autoupgrade_channel
   os_disk_size                           = var.k8s_node_disk_size
   k8s_keyvault_secrets_enabled           = var.k8s_keyvault_secrets_enabled
   k8s_keyvault_secret_rotation_enabled   = var.k8s_keyvault_secret_rotation_enabled
   k8s_keyvault_secret_rotation_interval  = var.k8s_keyvault_secret_rotation_interval

   k8s_default_node_pool_name             = local.k8s_default_pool_name
   default_node_count                     = var.default_node_count
   autoscale_node_vm_size                 = var.auto_scale_node_vm_size
   k8s_sku                                = var.k8s_sku
   vnet_subnet_id                         = module.subnet["devsecops-dev-pods-subnet"].subnet_id
   max_pods_per_node                      = var.max_pods_per_node
   k8s_min_nodes_count                    = (var.use_auto_scale == true ? var.auto_scale_min_nodes : null) 
   k8s_max_nodes_count                    = (var.use_auto_scale == true ? var.auto_scale_max_nodes : null) 
   log_analytics_enabled                  = var.log_analytics_enabled
   log_analytics_workspace_id             = module.la.id

   private_cluster_enabled                = var.enable_private_cluster
   private_cluster_with_public_fqdn       = var.enable_private_with_public_fqdn
   private_dns_zone_id                    = var.private_dns_zone_name #module.dns_zone.id 

   k8s_docker_bridge_ip                   = var.k8s_docker_bridge_ip
   k8s_dns_service_ip                     = var.k8s_dns_service_ip
   k8s_service_cidr                       = var.k8s_service_cidr
   k8s_azure_policy                       = var.enable_azure_policy
   use_auto_scale                         = var.use_auto_scale
   availability_zones                     = var.availability_zones 

   auto_scale_expander                    = var.auto_scale_expander
   auto_scale_max_node_provisioning_time  = var.k8s_max_node_provisioning_time
   auto_scale_new_pod_scaleup_delay       = var.k8s_new_pod_scaleup_delay
   auto_scale_scaledown_delay_add         = var.k8s_pod_scaledown_delay
   auto_scale_scaledown_delay_delete      = var.k8s_pod_scan_interval
   auto_scale_scaledown_delay_failure     = var.k8s_pod_scaledown_failure_delay
   auto_scale_scaledown_unneeded          = var.k8s_pod_scaledown_unneeded
   auto_scale_scaledown_unready           =  var.k8s_pod_scaledown_unready
   auto_scale_scan_interval               = var.k8s_pod_scan_interval

   k8s_iag_enabled                        = var.bool_k8s_iag_enabled
   k8s_iag_gw_name                        = local.k8s_iag_gw_name
   k8s_iag_subnet_cidr                    = var.k8s_iag_subnet_cidr
   k8s_iag_subnet_id                      = module.subnet["devsecops-dev-ingress-gw"].subnet_id

    #tags for Modules
        tag_alt_product                   = var.tag_alt_product
        tag_product                       = var.tag_product
        tag_created_by                    = var.tag_created_by
        tag_creation_method               = var.tag_creation_method
        tag_env                           = var.tag_env
        tag_subscription                  = var.tag_subscription
        tag_team_assigned                 = var.tag_team_assigned

        depends_on = [
          module.vnet,
          module.subnet#,
          #azurerm_bastion_host.bastion
        ]
}