resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "petclinic-nodegroup"
  node_role_arn   = "arn:aws:iam::000000000000:role/fake-nodegroup-role"
  subnet_ids      = [var.subnet_id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  instance_types = ["t3.medium"]
}
