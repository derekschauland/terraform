locals {
    required_tags = {
        CreatedBy = var.tag_created_by
        Subscription = var.tag_subscription
        Env = var.tag_env
        Product = var.tag_product
        CreationMethod = "terraform"
        Alt_Product = var.tag_alt_product
        Team = var.tag_team_assigned
    }
    
}

resource "azurerm_virtual_hub_connection" "hubconnect" {
    name                        = var.vhub_conn_name
    virtual_hub_id              = var.vhub_id
    remote_virtual_network_id   = var.project_vnet_id
    internet_security_enabled   = var.vhub_conn_internet_security_enabled
    

    #routing {
    #  associated_route_table_id = var.vhub_connect_route_table_id
    #  propagated_route_table {
    #    labels = var.vhub_prop_route_table_label
    #    route_table_ids = var.vhub_prop_route_table_ids
    #  }
    #  static_vnet_route {
    #    name = var.vhub_static_route_name
    #    address_prefixes = var.vhub_static_route_address_prefixes
    #    next_hop_ip_address = var.vhub_static_route_next_hop_address
    #  }
    #}
 

}
