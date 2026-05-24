data "azurerm_virtual_network" "data-vnet" {
  for_each            = var.peerings
  name                = each.value.spoke_vnet_name
  resource_group_name = each.value.spoke_rg_name
}
