variable "aks_clusters" {
  type = map(object({
    aks_name               = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    kubernetes_version  = string
    node_count          = number
    vm_size             = string
    data_subnet_name    = string
    virtual_network_name= string
  }))
}