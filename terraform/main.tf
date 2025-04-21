provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
}

# EKS Cluster Module
module "eks" {
  source          = "./modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
}

# ALB Ingress Controller Module
module "alb_ingress" {
  source    = "./modules/alb-ingress"
  cluster_name = module.eks.cluster_name
  vpc_id       = module.vpc.vpc_id
  region       = var.region
}

# ArgoCD Module
module "argocd" {
  source   = "./modules/argocd"
  eks_role = module.eks.cluster_iam_role_arn
}
