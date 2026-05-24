resource_groups = {
  hub-rg = {
    resource_group_name = "hub-rg"
    location            = "Central India"
  }

  spoke-rg = {
    resource_group_name = "spoke-rg"
    location            = "Central India"
  }
}

vnets = {
  hub-vnet = {
    name                = "hub-vnet"
    location            = "Central India"
    resource_group_name = "hub-rg"
    address_space       = ["10.0.0.0/16"]
  }

  spoke-vnet = {
    name                = "spoke-vnet"
    location            = "Central India"
    resource_group_name = "spoke-rg"
    address_space       = ["10.1.0.0/16"]
  }
}

subnets = {

  AzureBastionSubnet = {
    vnet_name           = "hub-vnet"
    resource_group_name = "hub-rg"
    address_prefixes    = ["10.0.1.0/24"]

    delegation = null
  }

  AzureFirewallSubnet = {
    vnet_name           = "hub-vnet"
    resource_group_name = "hub-rg"
    address_prefixes    = ["10.0.2.0/24"]

    delegation = null
  }

  GatewaySubnet = {
    vnet_name           = "hub-vnet"
    resource_group_name = "hub-rg"
    address_prefixes    = ["10.0.3.0/24"]

    delegation = null
  }

  aks-node-subnet = {
    vnet_name           = "spoke-vnet"
    resource_group_name = "spoke-rg"
    address_prefixes    = ["10.1.1.0/24"]

    delegation = null
  }

  ingress-subnet = {
    vnet_name           = "spoke-vnet"
    resource_group_name = "spoke-rg"
    address_prefixes    = ["10.1.2.0/24"]

    delegation = null
  }

  appgw-subnet = {
    vnet_name           = "spoke-vnet"
    resource_group_name = "spoke-rg"
    address_prefixes    = ["10.1.3.0/24"]

    delegation = null
  }

  private-endpoint-subnet = {
    vnet_name           = "spoke-vnet"
    resource_group_name = "spoke-rg"
    address_prefixes    = ["10.1.4.0/24"]

    delegation = null
  }

  api-server-subnet = {
    vnet_name           = "spoke-vnet"
    resource_group_name = "spoke-rg"
    address_prefixes    = ["10.1.5.0/24"]

    delegation = {
      name               = "aks-delegation"
      service_delegation = "Microsoft.ContainerService/managedClusters"
    }
  }
}

peerings = {

  hub-to-spoke = {
    name                = "hub-to-spoke"
    resource_group_name = "hub-rg"
    hub_vnet_name       = "hub-vnet"
    spoke_vnet_name     = "spoke-vnet"
    spoke_rg_name       = "spoke-rg"

  }

  spoke-to-hub = {
    name                = "spoke-to-hub"
    resource_group_name = "spoke-rg"
    hub_vnet_name       = "spoke-vnet"
    spoke_vnet_name     = "hub-vnet"
    spoke_rg_name       = "hub-rg"

  }
}

app_gateways = {

  appgw01 = {

    name                 = "appgw01"
    location             = "Central India"
    resource_group_name  = "spoke-rg"
    virtual_network_name = "spoke-vnet"
    data_subnet_name     = "appgw-subnet"


    public_ip_name    = "appgw01-pip"
    allocation_method = "Static"
    public_ip_sku     = "Standard"

    sku_name = "Standard_v2"
    sku_tier = "Standard_v2"
    capacity = 2

    gateway_ip_configuration_name = "appgw-ip-config"

    frontend_port_name = "frontend-port"
    frontend_port      = 80

    frontend_ip_configuration_name = "frontend-ip-config"

    backend_address_pool_name = "backend-pool"

    backend_http_settings_name = "backend-http-setting"
    cookie_based_affinity      = "Disabled"
    path                       = "/"
    backend_port               = 80
    backend_protocol           = "Http"
    request_timeout            = 60

    http_listener_name = "http-listener"
    listener_protocol  = "Http"

    request_routing_rule_name = "routing-rule"
    priority                  = 10
    rule_type                 = "Basic"
  }
}

acrs = {

  acr01 = {

    name                = "containerregistryTodo"
    resource_group_name = "spoke-rg"
    location            = "Central India"

    sku           = "Premium"
    admin_enabled = false

    georeplications = [

      {
        location                = "East US"
        zone_redundancy_enabled = true
        tags                    = {}
      },

      {
        location                = "North Europe"
        zone_redundancy_enabled = true
        tags                    = {}
      }
    ]

    tags = {
      environment = "dev"
      project     = "aks-hubspoke"
    }
  }
}

bastions = {
  bastion01 = {
    bastion_name         = "AzureBastion"
    location             = "central india"
    resource_group_name  = "hub-rg"
    data-subnet_name     = "AzureBastionSubnet"
    public_ip_name       = "pip-bastion"
    virtual_network_name = "hub-vnet"
  }
}

public-ip = {
  pip01 = {
    public_ip_name      = "appgw01-pip"
    resource_group_name = "spoke-rg"
    location            = "central india"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  pip02 = {
    public_ip_name      = "pip-bastion"
    resource_group_name = "hub-rg"
    location            = "central india"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip03 = {
    public_ip_name      = "pip-firewall"
    resource_group_name = "hub-rg"
    location            = "central india"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}



# keyvaults = {

#   kv01 = {

#     kv_name            = "kv-dev-001"
#     location           = "Central India"
#     resource_group_name = "spoke-rg"

#     enabled_for_disk_encryption = true

#     soft_delete_retention_days = 7
#     purge_protection_enabled   = true

#     sku_name = "standard"
#   }

#   kv02 = {

#     kv_name            = "kv-prod-001"
#     location           = "Central India"
#     resource_group_name = "hub-rg"

#     enabled_for_disk_encryption = true

#     soft_delete_retention_days = 30
#     purge_protection_enabled   = true

#     sku_name = "premium"
#   }
# }

firewalls = {

  firewall01 = {

    firewall_name        = "azure-firewall-01"
    location             = "Central India"
    resource_group_name  = "hub-rg"
    virtual_network_name = "hub-vnet"
    public_ip_name       = "pip-firewall"
    subnet_name          = "AzureFirewallSubnet"

    sku_name = "AZFW_VNet"
    sku_tier = "Premium"
  }
}

aks_clusters = {

  aks1 = {

    aks_name            = "aks-dev-001"
    location            = "Central India"
    resource_group_name = "spoke-rg"

    dns_prefix = "aksdev"

    kubernetes_version = "1.35.4"

    node_count = 2

    vm_size = "standard_b16as"

    data_subnet_name = "aks-node-subnet"

    virtual_network_name = "spoke-vnet"
  }

}

workspaces = {

  law01 = {

    name                = "law-dev-001"
    location            = "Central India"
    resource_group_name = "spoke-rg"
  }

  law02 = {

    name                = "law-prod-001"
    location            = "Central india"
    resource_group_name = "hub-rg"
  }
}
