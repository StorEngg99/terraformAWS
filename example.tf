provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}


resource "aws_instance" "example" {
  ami           = "ami-55ef662f"
  instance_type = "t2.micro"
}
resource "aws_eip" "ip_example" {
  instance="${aws_instance.example.id}"
}
