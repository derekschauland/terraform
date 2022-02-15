data "azurerm_container_registry" "acr" {
  name                  = var.acr_name
  resource_group_name   = var.acr_rg
}

resource "azurerm_role_assignment" "aks_to_acr" {
    scope = data.azurerm_container_registry.acr.id
    role_definition_name = "AcrPull"
    principal_id = module.k8s_cluster.kube_id
  
}