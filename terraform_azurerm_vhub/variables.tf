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

variable "vhub_conn_name" {
    description = "name for the virtual hub connection"
    default = ""
}

variable "vhub_id" {
    description = "the id for the virtual hub to which to connect - get this value from vhub module"
    default = ""
}

variable "project_vnet_id" {
    description = "the id for the VNet that will connect with a vhub - get this from the vnet module"
    default = ""
}

variable "vhub_conn_internet_security_enabled" {
    description = "True or False - is internet security enabled"
    type = bool
    default = false
}
