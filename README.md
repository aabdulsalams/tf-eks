# Terraform EKS Setup
This repo contains:
1. Terraform script to create Kubernetes cluster on AWS
2. Simple application manifest

### Prerequisite
1. AWS Account: https://aws.amazon.com/
2. Terraform installed: https://developer.hashicorp.com/terraform/install?product_intent=terraform
3. AWS Cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
4. Helm Installed: https://helm.sh/

### Steps

##### Setup Infrastructure
1. Inside 'infrastructure' directory run these command:
`terraform init` 
`terrafrom plan`
`terraform apply`
or you can run it with command `bash setup.sh` instead

##### Install Sample Application
1. Inside 'applications/simple-app' directory run these command:
`kubectl apply -f deployment.yaml`
`kubectl apply -f service.yaml`
`kubectl apply -f rbac.yaml`
`kubectl apply -f ingress.yaml`
or you can run it with command `bash setup.sh` instead

2. Inside 'applications/canary-app' directory run these command:
`helm repo add paulhopkins11 https://paulhopkins11.github.io/helm-canary`
`helm repo update`
`helm install canary paulhopkins11/helm-canary`
or you can run it with command bash setup.sh instead

#### Notes
Output kubeconfig support for managing kubeconfig and its associated local_file resources have been removed; users are able to use the awscli provided: `aws eks update-kubeconfig --name <cluster_name>` to create or their local kubeconfig as necessary. But if you want to using old module instead, you can provide the output kubeconfig file using:
`output "kubeconfig" {
  value = module.eks_cluster.kubeconfig_filename
}` at the last line of 3-eks.tf


#### Sources:
1. https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
2. https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
3. https://stackoverflow.com/questions/64820975/how-to-retrieve-the-eks-kubeconfig
4. https://github.com/terraform-aws-modules/terraform-aws-eks/blob/681e00aafea093be72ec06ada3825a23a181b1c5/docs/UPGRADE-18.0.md#variable-and-output-changes