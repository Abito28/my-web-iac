resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "my-iac-vpc"
  }
}

resource "aws_subnet" "subnet" {
  for_each = var.subnet

  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = "my-iac-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_association" {
  for_each = {
    for key, val in var.subnet : key => val
    if val.public == true
  }
  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.public_rt.id
}

