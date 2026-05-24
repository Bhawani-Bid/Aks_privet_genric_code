resource "azurerm_log_analytics_workspace" "law" {
  for_each = var.workspaces

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "PerGB2018"
}