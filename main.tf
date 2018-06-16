module "ec2" {
  source       = "./modules/nodes/ec2"
  ami          = "${var.ami}"
  instancetype = "${var.instancetype}"
  region       = "${var.region}"
}

module "ebs_a" {
  source            = "./modules/nodes/ebs"
  size              = "${var.size_a}"
  device_name   = "${var.device_name_a}"
  instance_id       = "${module.ec2.id}"
  region            = "${var.region}"
  availability_zone = "${module.ec2.availability_zone}"
}
module "ebs_b" {
  source            = "./modules/nodes/ebs"
  size              = "${var.size_b}"
  device_name   = "${var.device_name_b}"
  instance_id       = "${module.ec2.id}"
  region            = "${var.region}"
  availability_zone = "${module.ec2.availability_zone}"
}

output "ip" {
  value = "${module.ec2.public_ip}"
}
