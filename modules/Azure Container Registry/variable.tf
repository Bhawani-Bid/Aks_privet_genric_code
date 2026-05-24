variable "acrs" {

  type = map(object({

    name                = string
    resource_group_name = string
    location            = string

    sku           = string
    admin_enabled = bool

    georeplications = list(object({
      location                = string
      zone_redundancy_enabled = bool
      tags                    = map(string)
    }))

    tags = map(string)

  }))
}