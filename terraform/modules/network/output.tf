output "subnet_pub_1a" {
  value = aws_subnet.petclinic-public-subnet-1a.id
}

output "subnet_pub_1b" {
  value = aws_subnet.petclinic-public-subnet-1b.id
}

output "subnet_priv_1a" {
  value = aws_subnet.petclinic-private-subnet-1a.id
}

output "subnet_priv_1b" {
  value = aws_subnet.petclinic-private-subnet-1b.id
}

output "vpc_id" {
  value = aws_vpc.petclinic-app-vpc.id
}