data "azurerm_subnet" "data-subnet" {
    for_each = var.app_gateways
  name                 = each.value.data_subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
        for_each = var.app_gateways
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}