output "firewall_ids" {
  value = {
    for k, v in azurerm_firewall.firewall : k => v.id
  }
}