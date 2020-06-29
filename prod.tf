variable "region" {
  type = string
}
variable "image_id" {
  type = string
}
variable "instance_name" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "subnet_id" { # X2
  type = string
}
variable "key_pair" { # X2
  type = string
}
variable "pcs" {
  type = number
}

module "instance_deploy" {
  source = "./modules/instance_deploy"
  
  region        = var.region
  image_id      = var.image_id
  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_pair      = var.key_pair
  pcs           = var.pcs
}

module "instance_deploy_frank" {
  source = "./modules/instance_deploy"
  
  region        = "eu-central-1"
  image_id      = "ami-0a02ee601d742e89f"
  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id     = "subnet-0dbd84f0b33d6ad33"
  key_pair      = "aob-frank"
  pcs           = var.pcs
}