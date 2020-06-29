provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_s3_bucket" "erez-tf-course" {
  bucket = "erez-tf-course"
  acl    = "private"
}

data "aws_vpc" "aob-main" { # get data
  id = "vpc-006a34a4d7a2a356c"
}

data "aws_subnet" "aob-main" { # get data
  id = "subnet-050842545d0fce2d4"
}

resource "aws_security_group" "prod_web" {
  name        = "prod_web"
  description = "Allow standard http and https ports inbound and everything outbound"
  vpc_id      = data.aws_vpc.aob-main.id # use variable
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    "Terraform" : "true"
  }
}
  
resource "aws_instance" "prod_web" {
  count = 3

  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.nano"
  subnet_id     = data.aws_subnet.aob-main.id
  key_name      = "Erez-AOB-def"
  
  vpc_security_group_ids = [
    aws_security_group.prod_web.id
  ]

  tags = {
    "Terraform" : "true"
    "Name"      : "tf-test"
  }
}

resource "aws_instance" "aob_ppk" {

  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.nano"
  key_name      = "Erez-AOB-def"
  
  tags = {
    "Terraform" : "true"
    "Name"      : "tf-test"
  }
}