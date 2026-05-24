resource "azurerm_virtual_network_peering" "peer" {
  for_each = var.peerings

  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.hub_vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.data-vnet[each.key].id 

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}