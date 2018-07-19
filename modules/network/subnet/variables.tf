variable "vpc_id" {}
variable "subnet_cidr" {}
variable "availability_zone" {}
variable "subnet_tag" {}
variable "map_public_ip_on_launch" {
 description = "Decides if Subnet needs to have public IP autoassigned"
 default = "false"
}
