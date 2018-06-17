provider "aws" {
  region = "${var.region}"
}

resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2key"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "example" {
  ami           = "${var.ami}"
  instance_type = "${var.instancetype}"
  key_name      = "${aws_key_pair.ec2-key.key_name}"
}
