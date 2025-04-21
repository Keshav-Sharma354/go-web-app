// main.tf
resource "aws_lb" "app" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = var.security_groups
}
