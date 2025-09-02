resource "aws_vpc" "ansys" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ansys-vpc"
  }
}

resource "aws_internet_gateway" "ansys" {
  vpc_id = aws_vpc.ansys.id
  tags = {
    Name = "ansys-igw"
  }
}

resource "aws_subnet" "public" {
  for_each          = var.public_subnets
  vpc_id            = aws_vpc.ansys.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "private" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.ansys.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.key
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ansys.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ansys.id
  }
  tags = {
    Name = "ansys-public-route-table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ansys.id
  tags = {
    Name = "ansys-private-route-table"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}