variable "region" {
  description = "The AWS region to create resources in."
  type        = string
}

variable "vpc_module_version" {
  description = "The version of VPC module."
  type        = string
}

variable "vpc_name" {
  description = "The name of VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "The availability zones to use for the subnets."
  type        = list(string)
}

variable "eks_module_version" {
  description = "The version of EKS module."
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "ami_type" {
  description = "The Type of the EKS operating system."
  type        = string
}

variable "instance_type" {
  description = "The instance type for the node group."
  type        = list(string)
}


variable "node_group_name" {
  description = "The name of the node group."
  type        = string
}

variable "min_capacity" {
  description = "The minimum number of nodes."
  type        = number
}

variable "max_capacity" {
  description = "The maximum number of nodes."
  type        = number
}

variable "desired_capacity" {
  description = "The desired number of nodes."
  type        = number
}