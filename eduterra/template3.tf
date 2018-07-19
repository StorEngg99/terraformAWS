data "template_file" "test" {
 template = "${file("${path.cwd}/test.sh")}"
 vars {
    name = "mahesh"
  }
}

output render3 {
value = "${data.template_file.test.rendered}"
}
