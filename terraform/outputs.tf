output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "load_balancer_dns" {
  value = aws_lb.my_load_balancer.dns_name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}
