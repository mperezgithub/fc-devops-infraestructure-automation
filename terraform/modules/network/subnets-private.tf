resource "aws_subnet" "petclinic-private-subnet-1a" {
  vpc_id            = aws_vpc.petclinic-app-vpc.id
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  tags = merge(
    var.tags,
    {
      Name                               = "${var.project_name}-private-subnet-1a"
      "kubernetes.io/roles/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "petclinic-private-subnet-1b" {
  vpc_id            = aws_vpc.petclinic-app-vpc.id
  availability_zone = "${data.aws_region.current.name}b"
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)

  tags = merge(
    var.tags,
    {
      Name                               = "${var.project_name}-private-subnet-1b"
      "kubernetes.io/roles/internal-elb" = 1
    }
  )
}

resource "aws_route_table_association" "eks_private_route_table_asociation_1a" {
  subnet_id      = aws_subnet.petclinic-private-subnet-1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}

resource "aws_route_table_association" "eks_private_route_table_asociation_1b" {
  subnet_id      = aws_subnet.petclinic-private-subnet-1b.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}