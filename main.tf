# root main.tf


module "vpc" {
  source               = "./vpc"
  vpc_cidr             = var.vpc_cidr
  aws_region           = var.aws_region
  public_subnet        = [for i in range(2, 255, 2) : cidrsubnet("10.123.1.0/16", 8, i)]
  private_subnet       = [for i in range(1, 255, 2) : cidrsubnet("10.123.1.0/16", 8, i)]
  public_subnet_az     = var.public_subnet_az
  private_subnet_az    = var.private_subnet_az
  public_subnet_count  = var.public_subnet_count
  private_subnet_count = var.private_subnet_count

}
