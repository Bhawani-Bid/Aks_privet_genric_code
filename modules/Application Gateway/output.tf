output "application_gateway_ids" {
  value = {
    for k, v in azurerm_application_gateway.appgw : k => v.id
  }
}

# output "public_ip_ids" {
#   value = {
#     for k, v in azurerm_public_ip.pip : k => v.id
#   }
# }