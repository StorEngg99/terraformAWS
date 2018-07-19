resource "aws_security_group" "ssh_sg" {
  name        = "ssh_sg"
  description = " SSH access to server "
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    name = "${var.sg_name}"
  }
}
