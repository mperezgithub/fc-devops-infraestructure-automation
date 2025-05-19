resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodegroup"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  //capacity_type   = "SPOT"
  instance_types = ["t2.micro"]

  subnet_ids = [
    var.subnet_private_1a,
    var.subnet_private_1b,
  ]
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-nodegroup"
    }
  )
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attachment_cni,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_ecr,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_worker,
  ]
}

resource "aws_eks_node_group" "petclinic_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-petclinic-ng"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  instance_types  = ["t3.medium"]

  subnet_ids = [
    var.subnet_private_1a,
    var.subnet_private_1b,
  ]

  labels = {
    role = "petclinic"
  }

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-petclinic-ng"
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attachment_cni,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_ecr,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_worker,
  ]
}
