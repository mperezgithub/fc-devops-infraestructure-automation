variable "cidr_block" {
  type        = string
  description = "Networking CIDR para la VPN de CF DevOps Monitoring"
}

variable "project_name" {
  type        = string
  description = "Project name para ser usado por los recursos"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}