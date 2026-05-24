variable "subnets" {
  description = "Map of subnets configuration"

  type = map(object({
    resource_group_name = string
    vnet_name           = string
    address_prefixes    = list(string)

    delegation = optional(object({
      name               = string
      service_delegation = string
    }))
  }))
}