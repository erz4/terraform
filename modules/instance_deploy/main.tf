provider "aws" {
  profile = "default"
  region  = var.region
}

data "aws_subnet" "this" { # get data
  id = var.subnet_id
}

resource "aws_instance" "this" {
  count = var.pcs

  ami           = var.image_id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.this.id
  key_name      = var.key_pair

  tags = {
    "Terraform" : "true"
    "Name"      : var.instance_name
  }
}
