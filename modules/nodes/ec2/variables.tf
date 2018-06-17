variable "region" {}
variable "ami" {}
variable "instancetype" {}

variable "public_key_path" {
  description = "Public key path of User"
  default     = "~/.ssh/id_rsa.pub"
}
