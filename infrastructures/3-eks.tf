module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = var.eks_module_version
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type = var.ami_type
  }

  eks_managed_node_groups = {
    node_group_1 = {
      name         = var.node_group_name
      instance_types = var.instance_type[count.index]

      min_size     = var.min_capacity
      max_size     = var.max_capacity
      desired_size = var.desired_capacity
    }
  }
}

