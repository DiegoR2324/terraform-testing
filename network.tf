resource "aws_vpc" "practico-terraform-vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "test-terraform-vpc"
  }
}

resource "aws_subnet" "practico-terraform-subnet" {
  vpc_id                  = aws_vpc.practico-terraform-vpc.id
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "test-terraform-subnet"
  }
}

resource "aws_internet_gateway" "practico-terraform-igw" {
  vpc_id = aws_vpc.practico-terraform-vpc.id

  tags = {
    Name = "test-terraform-ig"
  }
}

resource "aws_route_table" "practico-terraform-routetable" {
  vpc_id = aws_vpc.practico-terraform-vpc.id

  route {
    cidr_block = "10.1.0.0/24"
    gateway_id = aws_internet_gateway.practico-terraform-igw.id
  }

  tags = {
    Name = "test-terraform-rt"
  }
}
