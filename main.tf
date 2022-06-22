terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

data "aws_availability_zones" "available" {}

provider "aws" {
  region  = "${var.region}"
}

resource "aws_instance" "app_server" {
  ami           = "${var.ami_instancia}"
  instance_type = "${var.tipo_instancia}"
  key_name      = var.key
  subnet_id	= module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ssh-y-ping.id, module.vpc.default_security_group_id]

  tags = {
    Name = "${var.prefijo}-INSTANCE"
  }
}

