module "vpc" {
  source        = "./modules/vpc"
  cidr_block    = var.vpc_cidr_block
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_name       = var.alb_name
}

module "asg" {
  source             = "./modules/asg"
  vpc_id             = module.vpc.vpc_id
  private_subnets    = module.vpc.private_subnets
  alb_target_group   = module.alb.target_group_arn
  ami_id             = var.ami_id
  instance_type      = var.instance_type
}
