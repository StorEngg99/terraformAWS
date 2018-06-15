module "ec2" {
  source       = "./modules/nodes/ec2"
  ami          = "${var.ami}"
  instancetype = "${var.instancetype}"
  region       = "${var.region}"
}

output "ip" {
 value = "${module.ec2.public_ip}"
}
