locals {
    required_tags = {
        CreatedBy = var.tag_created_by
        Subscription = var.tag_subscription
        Env = var.tag_env
        Product = var.tag_product
        CreationMethod = "terraform"
        Alt_Product = var.tag_alt_product
        Team = var.tag_team_assigned

        location = var.rg_location
    }
    resource_group_names = {
  (var.shared_resource_groups[0]) = {
    location = ["centralus"]
  }
}

k8s_name = "${local.required_tags["Team"]}-${local.required_tags["Env"]}-aks-cluster"
dns_prefix = "${local.required_tags["Team"]}-${local.required_tags["Env"]}"
k8s_default_pool_name = "nodepool3" # "${local.required_tags["Team"]}"
k8s_iag_gw_name = "${local.required_tags["Team"]}-${local.required_tags["Env"]}-k8s-ingress-gateway"
az_sql_name = "${local.required_tags["Team"]}-${local.required_tags["Env"]}-sql"
az_sqldb_name = "${local.required_tags["Team"]}-${local.required_tags["Env"]}-sql-db" 
storage_account_name = replace("${local.required_tags["Team"]}-${local.required_tags["Product"]}-sa","-","")

}

output "k8s_ip" {
  value = "${join("\", \"", module.k8s_cluster.lb_ip)}"
}

data "azuread_group" "dso" {
  display_name = var.k8s_rbac_admin_group_name
}