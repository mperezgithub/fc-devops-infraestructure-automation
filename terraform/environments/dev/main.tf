module "vpc" {
  source     = "../../modules/vpc"
  vpc_name   = "dev-vpc"
  vpc_tags   = { Environment = "dev" }
  vpc_cidr   = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}
module "eks" {
  source    = "../../modules/eks"
  subnet_id = module.vpc.subnet_id
}
