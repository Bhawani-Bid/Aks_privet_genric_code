module "resource_groups" {
  source = "../modules/resource_group"

  resource_groups = var.resource_groups
}

module "vnets" {
  depends_on = [module.resource_groups]
  source     = "../modules/vnet"

  vnets = var.vnets
}

module "subnets" {
  depends_on = [module.vnets]
  source     = "../modules/subnet"

  subnets = var.subnets
}

module "peerings" {
  depends_on = [module.vnets]
  source     = "../modules/peering"

  peerings = var.peerings
}

module "application_gateways" {

  depends_on = [module.resource_groups, module.public-ip, module.subnets, module.vnets]

  source = "../modules/Application Gateway"

  app_gateways = var.app_gateways
}

module "bation" {
  depends_on = [module.resource_groups, module.subnets, module.public-ip]
  source     = "../modules/Azure_bation"
  bastions   = var.bastions
}

module "public-ip" {
  depends_on = [module.resource_groups]
  source     = "../modules/public-ip"
  public-ip  = var.public-ip
}

# module "keyvault" {
#   source = "../modules/Key Vault"
#   keyvaults = var.keyvaults
# }

module "firewall" {
  depends_on = [module.resource_groups, module.public-ip, module.subnets]
  source     = "../modules/azure_firewall"
  firewalls  = var.firewalls
}

module "acr" {
  depends_on = [ module.resource_groups ]
  source = "../modules/Azure Container Registry"
  acrs   = var.acrs
}

module "aks" {
  depends_on = [ module.resource_groups,module.subnets]
  source = "../modules/aks"
  aks_clusters = var.aks_clusters
}

module "workspace" {
  depends_on = [ module.resource_groups ]
  source = "../modules/Log Analytics Workspace"
  workspaces = var.workspaces
}
