variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}
variable "alb_target_group" {}
variable "ami_id" {}
variable "instance_type" {}
