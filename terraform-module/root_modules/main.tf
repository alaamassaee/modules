terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}

module "networking" {
  source             = "../modules/networking_components_module"
  vpc_cider_block    = "10.0.0.0/16"
  subnet_cider_block = "10.0.0.0/24"
}
module "sg-module" {
  source = "../modules/security_group_module"
  vpc_id = module.networking.vpc_id
}
module "ssh_key" {
  source = "../modules/ssh_key_module"
}
module "ec2-module" {
  source                 = "../modules/ec2_module"
  image_id               = "ami-03a6eaae9938c858c"
  ec2_type               = "t2.micro"
  vpc_security_group_ids = module.sg-module.sg_id
  subnet_id              = module.networking.subnet_id
  key_name               = module.ssh_key.key_name
}

