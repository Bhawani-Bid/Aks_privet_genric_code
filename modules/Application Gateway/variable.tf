variable "app_gateways" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

   virtual_network_name= string
   data_subnet_name =string



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
