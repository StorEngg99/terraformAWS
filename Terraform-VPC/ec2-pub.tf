resource "aws_security_group" "web_sg" {
  name        = "web_ssh"
  description = " SSH access to web server "
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    name = "Web Sg"
  }
}

resource "aws_key_pair" "ec2keypair" {
  key_name   = "ec2-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGLiXDKV9+qpz28suKZSyDty81BFegaTo+F4wVNF5lyhRDUZnfJF83sPfWAK1kVc+o0zACqHQ8ESPihb9DxRn5NCOeB6DUX65iud9o5pjHeOXMA7VMa6UjRomimE+M/4BW3/uQnLoCysDqApC1gB5DACzgFMt1AOaHDcWa5X9eW2BO4TfOHmJA5fTbIgFG7Ff2O0Tm2+RqqNpjHAJRfgCy/tnVJZxKTTfdDiHM0Iv5HnfTUbKL9wV5Y4Y/xZ2sAsebqA0IZpNtiMYv/eELQMERxny0O53Szv1NcWUjcz2gSXOQxZ7QxICKcvZLVDV9sEhxuoaTfEfBNQxon8UQc9Z3 mahesh@ubuntu16"
}

resource "aws_instance" "web" {
  ami           = "ami-e251209a"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.public_subnet_a.id}"

  tags {
    name = "Web Server"
  }

  key_name               = "ec2-key"
  vpc_security_group_ids = ["${aws_security_group.web_sg.id}"]
  depends_on             = ["aws_subnet.public_subnet_a", "aws_security_group.web_sg", "aws_key_pair.ec2keypair"]
}

output "ip" {
  value = "${aws_instance.web.public_ip}"
}
