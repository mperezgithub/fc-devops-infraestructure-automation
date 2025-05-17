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
  description = "EKS cluster name to create manager cluster group"
}

variable "subnet_private_1a" {
  type        = string
  description = "Subnet private AZ 1a"
}

variable "subnet_private_1b" {
  type        = string
  description = "Subnet private AZ 1b"
}
