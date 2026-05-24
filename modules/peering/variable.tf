variable "peerings" {
  type = map(object({
    name                      = string
    resource_group_name       = string
    hub_vnet_name      = string
    spoke_vnet_name = string
    spoke_rg_name =string
    
  }))
}