resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "${var.infra_env}-vpc"
  }
}
resource "aws_subnet" "public" {
  for_each          = var.public_subnet_nums
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)

  tags = {
    Name   = "{var.infra_env}-public-subnet"
    Subnet = "${each.key}-${each.value}"
  }
}

resource "aws_subnet" "private" {
  for_each          = var.private_subnet_nums
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)

  tags = {
    Name   = "{var.infra_env}-private-subnet"
    Subnet = "${each.key}-${each.value}"
  }


}


