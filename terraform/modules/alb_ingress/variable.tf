// variables.tf
variable "lb_name" {}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
