module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = var.vpc_module_version

  name = var.vpc_name

  cidr = var.vpc_cidr
  azs  = var.availability_zones[count.index]

  private_subnets = var.private_subnet_cidrs[count.index]
  public_subnets  = var.public_subnet_cidrs[count.index]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}