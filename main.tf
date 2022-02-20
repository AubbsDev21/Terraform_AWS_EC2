provider "aws" {
  profile = var.profile
  region  = var.main-region
  alias   = "region-master"
}
provider "aws" {
  profile = var.profile
  region  = var.worker-region
  alias   = "region-worker"
}

module "vpc" {
  source = "./modules/VPC"

  infra_env = var.infra_env

  vpc_cidr = "10.0.0.0/17"
}
