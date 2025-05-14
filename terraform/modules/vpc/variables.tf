
variable "vpc_name" {
  description = "Nombre para el tag Name de la VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Map de tags adicionales para la VPC"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "CIDR block para la VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block para la Subnet"
  type        = string
}