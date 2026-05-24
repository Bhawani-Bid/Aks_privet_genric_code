variable "bastions" {
  type = map(object({
    bastion_name                = string
    location            = string
    resource_group_name = string
    data-subnet_name    = string
    public_ip_name      = string
    virtual_network_name= string
  }))
}
