module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_priv_1a
  public_subnet_1b = module.eks_network.subnet_priv_1b
}

module "eks_managed_node_group" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  tags              = local.tags
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
}

module "eks_load_balancer_controller" {
  source       = "./modules/load-balancer-controller"
  project_name = var.project_name
  tags         = local.tags
  cluster_name = module.eks_cluster.cluster_name
  oidc         = module.eks_cluster.oidc
  vpc_id       = module.eks_network.vpc_id
}

