provider "aws" {
  profile = "default"
  region  = var.region
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  # version                = "~> 1.11"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "15.2.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.19"
  subnets         = var.subnets
  vpc_id = var.vpc_id

  node_groups = {
    first = {
      desired_capacity = 3
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t2.micro"
    }
  }

  write_kubeconfig   = true
  config_output_path = "./"
}