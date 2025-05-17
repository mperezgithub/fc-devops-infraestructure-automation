variable "project_name" {
  type        = string
  description = "Project name para ser usado por los recursos"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name to create load balancer controller"
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "oidc" {
  type        = string
  description = "Https URL from oidc for EKS cluster"
}