# vpc main.tf

resource "random_integer" "rand_int" {
  min = 1
  max = 10
}


resource "aws_vpc" "elliotts_aws_sandbox" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "elliott_arnold_vpc_sandbox-${random_integer.rand_int.id}"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = var.public_subnet_count
  cidr_block              = var.public_subnet[count.index]
  vpc_id                  = aws_vpc.elliotts_aws_sandbox.id
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az[count.index]

  tags = {
    Name = "subnet-${var.public_subnet_az[count.index]}-${count.index}"
  }
}

resource "aws_subnet" "private_subnet" {

  count                   = var.private_subnet_count
  cidr_block              = var.private_subnet[count.index]
  vpc_id                  = aws_vpc.elliotts_aws_sandbox.id
  map_public_ip_on_launch = false
  availability_zone       = var.private_subnet_az[count.index]

  tags = {
    Name = "subnet-${var.private_subnet_az[count.index]}-${count.index}"
  }
}
