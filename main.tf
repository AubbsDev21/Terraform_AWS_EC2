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
