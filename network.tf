#create VPC 
module "vpc" {
  source   = "./modules/network/vpc"
  region   = "${var.region}"
  vpc_cidr = "${var.vpc_cidr}"
  vpc_tag  = "${var.vpc_tag}"
}
