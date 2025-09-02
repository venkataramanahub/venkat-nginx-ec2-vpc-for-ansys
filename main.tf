terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnets = {
    ansys-public-subnet1a = { cidr_block = "10.0.1.0/24", availability_zone = "us-east-1a" }
    ansys-public-subnet1b = { cidr_block = "10.0.2.0/24", availability_zone = "us-east-1b" }
    ansys-public-subnet1c = { cidr_block = "10.0.3.0/24", availability_zone = "us-east-1c" }
  }
  private_subnets = {
    ansys-private-subnet1a = { cidr_block = "10.0.10.0/24", availability_zone = "us-east-1a" }
    ansys-private-subnet1b = { cidr_block = "10.0.11.0/24", availability_zone = "us-east-1b" }
    ansys-private-subnet1c = { cidr_block = "10.0.12.0/24", availability_zone = "us-east-1c" }
  }
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_ids[0]
  instance_key_name = "bastion"
}