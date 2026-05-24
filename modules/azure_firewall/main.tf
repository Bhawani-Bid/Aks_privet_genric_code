resource "azurerm_firewall" "firewall" {
  for_each = var.firewalls

  name                = each.value.firewall_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.data-subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
  # lifecycle {

  #   prevent_destroy = true

  #   ignore_changes = [

  #     tags,

  #     dns_servers,

  #     private_ip_ranges
  #   ]
  # }
}