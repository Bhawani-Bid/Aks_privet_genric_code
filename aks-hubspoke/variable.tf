variable "resource_groups" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

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

variable "peerings" {
  type = map(object({
    name                = string
    resource_group_name = string
    hub_vnet_name       = string
    spoke_vnet_name     = string
    spoke_rg_name =string

  }))
}

variable "app_gateways" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

    virtual_network_name = string
    data_subnet_name     = string


    public_ip_name    = string
    allocation_method = string
    public_ip_sku     = string

    sku_name = string
    sku_tier = string
    capacity = number

    gateway_ip_configuration_name = string

    frontend_port_name = string
    frontend_port      = number

    frontend_ip_configuration_name = string

    backend_address_pool_name = string

    backend_http_settings_name = string
    cookie_based_affinity      = string
    path                       = string
    backend_port               = number
    backend_protocol           = string
    request_timeout            = number

    http_listener_name = string
    listener_protocol  = string

    request_routing_rule_name = string
    priority                  = number
    rule_type                 = string

  }))
}


variable "bastions" {
  type = map(object({
    bastion_name         = string
    location             = string
    resource_group_name  = string
    data-subnet_name     = string
    public_ip_name       = string
    virtual_network_name = string
  }))
}

variable "public-ip" {
  type = map(object({
    public_ip_name      = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
  }))
}

# variable "keyvaults" {

#   type = map(object({

#     kv_name             = string
#     location            = string
#     resource_group_name = string

#     enabled_for_disk_encryption = bool

#     soft_delete_retention_days = number
#     purge_protection_enabled   = bool

#     sku_name = string

#   }))
# }

variable "firewalls" {
  type = map(object({
    firewall_name        = string
    location             = string
    resource_group_name  = string
    sku_name             = string
    sku_tier             = string
    virtual_network_name = string
    public_ip_name       = string
    subnet_name          = string
  }))
}

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

variable "aks_clusters" {
  type = map(object({
    aks_name             = string
    location             = string
    resource_group_name  = string
    dns_prefix           = string
    kubernetes_version   = string
    node_count           = number
    vm_size              = string
    data_subnet_name     = string
    virtual_network_name = string
  }))
}

variable "workspaces" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

  }))
}
