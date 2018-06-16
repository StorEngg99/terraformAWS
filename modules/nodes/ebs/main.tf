provider "aws" {
  region = "${var.region}"
}

resource "aws_ebs_volume" "example" {
  size              = "${var.size}"
  availability_zone = "${var.availability_zone}"
  type              = "gp2"

  #Default is standard so we have set type to gp2
}

resource "aws_volume_attachment" "example_attach" {
  device_name = "${var.device_name}"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${var.instance_id}"
}
