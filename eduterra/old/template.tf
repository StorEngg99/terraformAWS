variable "count" {
 default = 2
}

variable "hostnames" {
 default = {
 "0" = "example1.org"
 "1" = "example2.net"
 }
}

data "template_file" "example2" {

  count = "${length(var.hostnames)}"
  template = " $${location} $${world}"
  vars {
    world = "${var.hostnames[count.index]}"
    location = "${count.index}"
  }
}

output "rendered2" {
  value = "${data.template_file.example2.*.rendered}"
}
