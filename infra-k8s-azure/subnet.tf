# this controls the azure subnet resource
module "subnet" {
  source = "gitlab.com/zywave/terraform/subnet"
  version = "1.0.0-rc.13"

    for_each =  var.subnets
    subnet_name = each.key
 
  subnet_resource_group_name = module.rg.rg_name
  subnet_virtual_network = module.vnet.vnet_name
  subnet_cidr = each.value.cidr


}