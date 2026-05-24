resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes

  dynamic "delegation" {
    for_each = each.value.delegation != null ? [1] : []

    content {
      name = each.value.delegation.name

      service_delegation {
        name = each.value.delegation.service_delegation

        actions = ["Microsoft.Network/virtualNetworks/subnets/join/action",
         "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]

      }
    }
  }
}