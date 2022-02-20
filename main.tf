provider "aws" {
  profile = var.profile
  region  = var.main-region
  alias   = "region-master"
}


data "aws_ami" "ubuntu" {
  most_recent = true


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  owners = ["099720109477"]
}





module "vpc" {
  source = "./modules/VPC"

  infra_env = var.infra_env

  vpc_cidr = "10.0.0.0/17"
}



module "ec2_main" {
  source        = "./modules/EC2"
  infra_env     = var.infra_env
  instance_size = "t3.small"
  instance_ami  = data.aws_ami.ubuntu.id
}

module "ec2_worker" {
  source                    = "./modules/EC2"
  infra_env                 = var.infra_env
  instance_size             = "t3.large"
  instance_ami              = data.aws_ami.ubuntu.id
  instance_root_device_size = 50
}

