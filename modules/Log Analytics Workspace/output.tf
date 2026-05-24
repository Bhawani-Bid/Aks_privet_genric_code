output "workspace_ids" {
  value = {
    for k, v in azurerm_log_analytics_workspace.law : k => v.id
  }
}