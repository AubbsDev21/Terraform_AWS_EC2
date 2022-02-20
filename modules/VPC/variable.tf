variable "infra_env" {
  type        = string
  description = "infrasturcture Environment"
}

variable "vpc_cidr" {
  type        = string
  description = "The IP range to use for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_nums" {
  type = map(number)

  description = "Map of AZ to a number that should be used for public subnets"

  default = {
    "us-east-2a" = 1
    "us-east-2b" = 2
    "us-east-2c" = 3
  }
}

variable "private_subnet_nums" {
  type = map(number)

  description = "Map of AZ to a number that should be used for private subnets"

  default = {
    "us-east-2a" = 4
    "us-east-2b" = 5
    "us-east-2c" = 6
  }
}

variable "enable_dns_support" {
  type    = bool
  default = false
}

variable "enable_dns_hostnames" {
  type    = bool
  default = false
}
