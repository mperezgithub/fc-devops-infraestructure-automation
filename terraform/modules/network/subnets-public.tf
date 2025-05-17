resource "aws_subnet" "petclinic-public-subnet-1a" {
  vpc_id                  = aws_vpc.petclinic-app-vpc.id
  availability_zone       = "${data.aws_region.current.name}a"
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name                                                 = "${var.project_name}-public-subnet-1a"
      "kubernetes.io/role/elb"                            = "1"
      "kubernetes.io/cluster/petclinic-monitoring-cluster" = "owned"
    }
  )
}

resource "aws_subnet" "petclinic-public-subnet-1b" {
  vpc_id                  = aws_vpc.petclinic-app-vpc.id
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)

  tags = merge(
    var.tags,
    {
      Name                                                 = "${var.project_name}-public-subnet-1b"
      "kubernetes.io/role/elb"                            = "1"
      "kubernetes.io/cluster/petclinic-monitoring-cluster" = "owned"
    }
  )
}

resource "aws_route_table_association" "eks_public_route_table_asociation_1a" {
  subnet_id      = aws_subnet.petclinic-public-subnet-1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_public_route_table_asociation_1b" {
  subnet_id      = aws_subnet.petclinic-public-subnet-1b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}