variable "firewalls" {
  type = map(object({
    firewall_name        = string
    location             = string
    resource_group_name  = string
    sku_name             = string
    sku_tier             = string
    virtual_network_name = string
    public_ip_name       = string
    subnet_name          = string
  }))
}
