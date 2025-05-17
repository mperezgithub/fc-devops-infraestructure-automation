output "oidc" {
  value = module.eks_cluster.oidc
}

output "ca" {
  value = module.eks_cluster.certificate_authority
}

output "endpoint" {
  value = module.eks_cluster.endpoint
}

output "vpc_id" {
  value = module.eks_network.vpc_id
}