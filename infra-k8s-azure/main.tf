locals {
    required_tags = {
        Namespace = var.namespace
        Subscription = var.subscription_name
        Environment = var.environment
        CreationMethod = "terraform"
        Team_name = var.team_name
    }

        suffix = ["${var.namespace}-${var.environment}-${replace(var.resource_name, " ","")}"]
        dns_prefix = "${local.required_tags["Team_name"]}-${local.required_tags["Environment"]}"
    
#    resource_group_names = {
#  (var.shared_resource_groups[0]) = {
#    location = ["centralus"]
#  }
#}
k8s_default_pool_name = "${local.required_tags["Namespace"]}np"


subnets_list = flatten([
  for ip in var.subnet_cidr : {
    subnet_name = join("-", [module.naming.subnet.name, index(var.subnet_cidr, ip)+1])
    cidr = ip
    service_delegation = false
  }
])
subnets = { for subnet in local.subnets_list :
  subnet["subnet_name"] => {
    cidr = [subnet["cidr"]]
    service_delegation = subnet["service_delegation"]
  }

}

#
##trying to create a map out of vars to ensure vars are only edited items

sql_fwrules_list = flatten([
  for ip in var.az_fw_start_ips :  {
    #for end_key, end_ip in var.az_fw_end_ips : {
      rule_name = join("-", [module.naming.sql_firewall_rule.name, index(var.az_fw_start_ips, ip)+1])
      start_ip = ip
      end_ip = element(var.az_fw_end_ips, index(var.az_fw_start_ips, ip))
    }
])

sql_fwrules = { for rule in local.sql_fwrules_list :
  rule["rule_name"] => {
    start_ip = rule["start_ip"]
    end_ip = rule["end_ip"]
  }

}

}
