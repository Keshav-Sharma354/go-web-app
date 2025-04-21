variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS Cluster"
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "EKS Cluster version"
  default     = "1.21"
}

variable "node_group_instance_type" {
  description = "EC2 instance type for the EKS node group"
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired capacity for node group"
  default     = 2
}

variable "min_capacity" {
  description = "Minimum capacity for node group"
  default     = 1
}

variable "max_capacity" {
  description = "Maximum capacity for node group"
  default     = 3
}
