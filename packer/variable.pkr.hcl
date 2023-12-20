variable "project" {
  type    = string
  default = "Shoppingapp"
}

variable "env" {
  type    = string
  default = "Production"
}

variable "ami" {
  type    = string
  default = "ami-0a0f1259dd1c90938"
}

locals {
  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm-ss", timestamp())}"
  image-name = "${var.project}-${var.env}-${local.image-timestamp}"

}
