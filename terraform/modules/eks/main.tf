resource "aws_eks_cluster" "eks" {
  name     = "petclinic-cluster"
  role_arn = "arn:aws:iam::000000000000:role/fake-role"
  vpc_config {
    subnet_ids = [var.subnet_id]
  }
}
