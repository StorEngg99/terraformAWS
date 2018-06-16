output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}

output "id" {
  value = "${aws_instance.example.id}"
}

output "availability_zone" {
  value = "${aws_instance.example.availability_zone}"
}
